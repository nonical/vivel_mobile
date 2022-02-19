import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:intl/intl.dart';

class DriveWidget extends StatelessWidget {
  final Drive drive;

  const DriveWidget({Key? key, required this.drive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {}, // TODO: add link to drive
      child: Container(
        color: Colors.white,
        height: 130,
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
                          color: Color.fromRGBO(255, 100, 124, 100),
                          shape: BoxShape.circle),
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
                          child: Text("DZ Hospital",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(DateFormat('MMMM dd, y')
                              .add_jm()
                              .format(DateTime.parse(drive.date))),
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
