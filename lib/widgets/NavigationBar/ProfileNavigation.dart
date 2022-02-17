import 'package:flutter/material.dart';

class ProfileNavigation extends AppBar {
  ProfileNavigation()
      : super(
          title: Text("Profile"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => {},
                icon: Image.asset('assets/more-horizontal.png'))
          ],
        );
}
