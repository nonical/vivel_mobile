import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:vivel_mobile/pages/active_drives_page.dart';
import 'package:vivel_mobile/widgets/drive.dart';

class HomeDrives extends StatelessWidget {
  final List<Drive> drives;

  const HomeDrives({Key? key, required this.drives}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: const [
                Text(
                  "Active drives",
                  style: HEADING5,
                )
              ]),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ActiveDrivesPage(),
                          ));
                    },
                    child: const Text(
                      "Show all",
                      style: TextStyle(
                          color: RED, decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Column(
          children: drives.map((drive) {
            return Column(
              children: [
                DriveWidget(drive: drive),
                const Divider(
                  height: 1,
                  color: GRAY4,
                )
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
