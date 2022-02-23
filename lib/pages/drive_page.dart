import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:vivel_mobile/services/drive_service.dart';
import 'package:vivel_mobile/utils/map_launcher.dart';
import 'package:vivel_mobile/utils/mapbox.dart';
import 'package:vivel_mobile/widgets/navigation_bar/back_navigation.dart';
import 'package:vivel_mobile/widgets/submit_button.dart';

class DrivePage extends StatefulWidget {
  final String driveId;

  const DrivePage({Key? key, required this.driveId}) : super(key: key);

  @override
  _DrivePageState createState() => _DrivePageState();
}

class _DrivePageState extends State<DrivePage> {
  late Future<Drive> drive;

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
                return body(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const Center(child: CircularProgressIndicator());
            }));
  }
}

Widget body(Drive drive) {
  return SizedBox.expand(
    child: Column(
      children: [
        Center(
            child: GestureDetector(
          child: Image(
              image: getStaticImage(
                  drive.hospital!.longitude, drive.hospital!.latitude)),
          onTap: () {
            openLocationInMaps(drive.hospital!.longitude,
                drive.hospital!.latitude, drive.hospital!.name);
          },
        )),
        Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    if (drive.urgency)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('URGENT',
                            style: HEADING3.copyWith(color: RED)),
                      ),
                    Text(
                      drive.hospital!.name,
                      style: BIG_HEADER,
                    ),
                    Text(
                      DateFormat(DateFormat.YEAR_MONTH_DAY)
                          .format(DateTime.parse(drive.createdAt)),
                      style: HEADING4,
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
                            drive.bloodType,
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
                            '${drive.amount} ml',
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
              padding: const EdgeInsets.only(left: 25, right: 25),
              // TODO: Implement 'Apply' method
              child: SubmitButton(text: 'Apply', onPressed: () => {}),
            )),
          ],
        )
      ],
    ),
  );
}
