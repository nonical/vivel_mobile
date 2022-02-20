import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';

class ProfileNavigation extends AppBar {
  ProfileNavigation({Key? key})
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
                onPressed: () => {},
                icon: Image.asset('assets/more-horizontal.png'))
          ],
        );
}
