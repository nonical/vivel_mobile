import 'package:flutter/material.dart';

class ProfileNavigation extends AppBar {
  ProfileNavigation()
      : super(
          title: Text("Profile"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 17),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            IconButton(
                onPressed: () => {},
                icon: Image.asset('assets/more-horizontal.png'))
          ],
        );
}
