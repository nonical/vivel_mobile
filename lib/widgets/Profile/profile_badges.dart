import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/badge.dart';
import 'package:vivel_mobile/pages/badges_page.dart';
import 'dart:convert';

import 'package:vivel_mobile/widgets/badge.dart';

class ProfileBadges extends StatelessWidget {
  final String userId;
  final List<Badge> badges;
  const ProfileBadges({Key? key, required this.badges, required this.userId})
      : super(key: key);

  Widget sizedBox(Widget child) {
    return SizedBox(
      height: 150,
      width: 150,
      child: child,
    );
  }

  List<Widget> badgesWidget() {
    if (badges.isNotEmpty) {
      return badges.take(2).map((badge) {
        return sizedBox(BadgeWidget(
            image: MemoryImage(base64Decode(badge.picture)), text: badge.name));
      }).toList();
    } else {
      return [sizedBox(const Center(child: Text("No badges yet!")))];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: const [
              Text(
                "Latest badges",
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
                          builder: (context) => BadgesPage(userId: userId),
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
      Row(
        children: [
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: badgesWidget()),
          ),
        ],
      )
    ]);
  }
}
