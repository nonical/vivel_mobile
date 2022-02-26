import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/pages/wiki_page.dart';

class ProfileNavigation extends AppBar {
  ProfileNavigation(BuildContext context, {Key? key})
      : super(
          key: key,
          title: const Text("Profile"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: BLACK, fontSize: 17),
          iconTheme: const IconThemeData(
            color: BLACK,
          ),
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WikiPage()))
                    },
                icon: SvgPicture.asset("assets/questionmark.svg"))
          ],
        );
}
