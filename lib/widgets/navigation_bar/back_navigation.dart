import 'package:flutter/material.dart';

class BackNavigation extends AppBar {
  BackNavigation(String title, {Key? key})
      : super(
          key: key,
          title: Text(title),
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 17),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
        );
}
