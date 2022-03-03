import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:vivel_mobile/services/donation_service.dart';
import 'package:vivel_mobile/services/drive_service.dart';
import 'package:vivel_mobile/utils/map_launcher.dart';
import 'package:vivel_mobile/utils/mapbox.dart';
import 'package:vivel_mobile/utils/snack_bar.dart';
import 'package:vivel_mobile/widgets/navigation_bar/back_navigation.dart';
import 'package:vivel_mobile/widgets/submit_button.dart';

class DrivePage extends StatefulWidget {
  final String driveId;
  final String userId;

  const DrivePage({Key? key, required this.driveId, required this.userId})
      : super(key: key);

  @override
  _DrivePageState createState() => _DrivePageState();
}

class _DrivePageState extends State<DrivePage> {
  late Future<Drive> drive;

  void apply(BuildContext context) async {
    final request = {"driveId": widget.driveId, "userId": widget.userId};
    var snackBarText = "Successfully applied";
    try {
      await DonationService.post(request);
    } on Exception {
      snackBarText = "You can't apply to this drive";
    }

    SnackBarUtil.openSnackBar(context, snackBarText);
  }

  @override
  void initState() {
    super.initState();
    drive = DriveService.getById(widget.driveId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: BackNavigation(
          'Drive',
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: FutureBuilder<Drive>(
            future: drive,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox.expand(
                  child: Column(
                    children: [
                      Center(
                          child: GestureDetector(
                        child: Image(
                            image: getStaticImage(
                                snapshot.data!.hospital!.longitude,
                                snapshot.data!.hospital!.latitude)),
                        onTap: () {
                          openLocationInMaps(
                              snapshot.data!.hospital!.longitude,
                              snapshot.data!.hospital!.latitude,
                              snapshot.data!.hospital!.name);
                        },
                      )),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  if (snapshot.data!.urgency)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('URGENT',
                                          style: HEADING3.copyWith(color: RED)),
                                    ),
                                  Text(
                                    snapshot.data!.hospital!.name,
                                    style: BIG_HEADER,
                                  ),
                                  Text(
                                    DateFormat(DateFormat.YEAR_MONTH_DAY)
                                        .format(DateTime.parse(
                                            snapshot.data!.createdAt)),
                                    style: HEADING4,
                                  )
                                ],
                              )),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 75, bottom: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      SvgPicture.asset('assets/droplet.svg'),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          snapshot.data!.bloodType,
                                          style: HEADING3.copyWith(color: RED1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SvgPicture.asset('assets/funnel.svg'),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          '${snapshot.data!.amount} ml',
                                          style: HEADING3.copyWith(color: RED1),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                child: SubmitButton(
                                  text: 'Apply',
                                  onPressed: () async => apply(context),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const Center(child: CircularProgressIndicator());
            }));
  }
}
