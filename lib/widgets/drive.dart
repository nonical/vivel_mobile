import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:vivel_mobile/pages/drive_page.dart';

class DriveWidget extends StatelessWidget {
  final Drive drive;

  const DriveWidget({Key? key, required this.drive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DrivePage(
                driveId: drive.driveId,
              ),
            ))
      },
      child: Container(
        color: Colors.white,
        height: 88,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                          color: RED, shape: BoxShape.circle),
                      child: Center(
                          child: Text(
                        drive.bloodType,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    )
                  ],
                )),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 10),
                          child: Text(drive.hospital!.name, style: HEADING5),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(DateFormat(DateFormat.YEAR_MONTH_DAY)
                              .format(DateTime.parse(drive.date))),
                        ),
                      ),
                      if (drive.urgency == true)
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "URGENT",
                              style: TextStyle(color: RED),
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/chevron-right.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
