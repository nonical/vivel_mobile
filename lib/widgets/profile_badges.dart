import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:vivel_mobile/widgets/badge.dart';

class ProfileBadges extends StatelessWidget {
  final String picture =
      "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";

  const ProfileBadges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Text(
                "Latest badges",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              )
            ]),
            Column(
              children: [Text("Show all")],
            )
          ],
        ),
      ),
      Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: BadgeWidget(
                      image: MemoryImage(base64Decode(picture)),
                      text: "Bedgze"),
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: BadgeWidget(
                      image: MemoryImage(base64Decode(picture)),
                      text: "Bedgze"),
                )
              ],
            ),
          ),
        ],
      )
    ]);
  }
}
