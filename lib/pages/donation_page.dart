import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/donation.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:vivel_mobile/services/donation_service.dart';
import 'package:vivel_mobile/widgets/NavigationBar/back_navigation.dart';
import 'package:vivel_mobile/widgets/blood_report.dart';

class DonationPage extends StatefulWidget {
  final String donationId;

  const DonationPage({Key? key, required this.donationId}) : super(key: key);

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  late Future<Tuple2<Donation, Drive>> donation;
  // late Future<Hospital> hospital;

  @override
  void initState() {
    super.initState();
    donation = DonationService.getByIdWithDrive(widget.donationId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackNavigation('Donation'),
      body: SizedBox.expand(
          child: FutureBuilder<Tuple2<Donation, Drive>>(
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

  Widget body(Tuple2<Donation, Drive> data) {
    return Column(
      children: [
        Column(
          children: [
            const Text(
              'DZ Cazin',
              style: BIG_HEADER,
            ),
            Text(
              DateFormat(DateFormat.YEAR_MONTH_DAY)
                  .format(DateTime.parse(data.item2.date)),
              style: HEADING4,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset('assets/droplet.png'),
                Text(
                  data.item2.bloodType,
                  style: HEADING3.copyWith(color: RED1),
                )
              ],
            ),
            Column(
              children: [
                Image.asset('assets/funnel.png'),
                Text(
                  '${data.item1.amount} ml',
                  style: HEADING3.copyWith(color: RED1),
                )
              ],
            )
          ],
        ),
        BloodReport(
          erythrocyteCount: data.item1.erythrocyteCount,
          leukocyteCount: data.item1.leukocyteCount,
          plateletCount: data.item1.plateletCount,
        )
      ],
    );
  }
}
