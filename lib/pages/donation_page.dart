import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/donation.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:vivel_mobile/models/hospital.dart';
import 'package:vivel_mobile/services/donation_service.dart';
import 'package:vivel_mobile/widgets/navigation_bar/back_navigation.dart';
import 'package:vivel_mobile/widgets/blood_report.dart';
import 'package:vivel_mobile/widgets/card.dart';

class DonationPage extends StatefulWidget {
  final String donationId;

  const DonationPage({Key? key, required this.donationId}) : super(key: key);

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  late Future<Tuple3<Donation, Drive, Hospital>> donation;

  @override
  void initState() {
    super.initState();
    donation = DonationService.getByIdWithDriveAndHospital(widget.donationId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackNavigation('Donation'),
      body: SizedBox.expand(
          child: FutureBuilder<Tuple3<Donation, Drive, Hospital>>(
              future: donation,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return body(snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const Center(child: CircularProgressIndicator());
              })),
    );
  }

  Widget body(Tuple3<Donation, Drive, Hospital> data) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text(
                  data.item3.name,
                  style: BIG_HEADER,
                ),
                Text(
                  DateFormat(DateFormat.YEAR_MONTH_DAY)
                      .format(DateTime.parse(data.item1.createdAt)),
                  style: HEADING4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Status: ${data.item1.status}',
                      style: CAPTION1.copyWith(color: GRAY3)),
                )
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(top: 75, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset('assets/droplet.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        data.item2.bloodType,
                        style: HEADING3.copyWith(color: RED1),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/funnel.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        '${data.item1.amount} ml',
                        style: HEADING3.copyWith(color: RED1),
                      ),
                    )
                  ],
                )
              ],
            )),
        conditionalCard(data.item1)
      ],
    );
  }
}

Widget conditionalCard(Donation donation) {
  if (donation.status == 'Approved') {
    return BloodReport(
        leukocyteCount: donation.leukocyteCount,
        erythrocyteCount: donation.erythrocyteCount,
        plateletCount: donation.plateletCount);
  }

  String message;

  // TODO: possibly move these messages to a seperate module (e.g. templates/messages.dart)
  switch (donation.status) {
    case 'Pending':
      message = 'Your donation will be scheduled by hospital staff soon.';
      break;
    case 'Scheduled':
      message =
          'Your donation is scheduled for:\n${DateFormat(DateFormat.YEAR_MONTH_DAY).format(DateTime.parse(donation!.scheduledAt!))} at ${DateFormat(DateFormat.HOUR_MINUTE).format(DateTime.parse(donation.scheduledAt!))}';
      break;
    case 'Rejected':
      message = 'Your donation has been rejected:\n${donation.note}';
      break;
    default:
      message = '';
  }

  return CardContainer(
      height: 250,
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: HEADING6,
        ),
      ));
}
