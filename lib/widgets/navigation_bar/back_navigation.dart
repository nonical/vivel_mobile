import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';

class BackNavigation extends AppBar {
  BackNavigation(String title, {Key? key, Color backgroundColor = Colors.white})
      : super(
          key: key,
          title: Text(title),
          elevation: 0,
          backgroundColor: backgroundColor,
          titleTextStyle: const TextStyle(color: BLACK, fontSize: 17),
          iconTheme: const IconThemeData(
            color: BLACK,
          ),
          centerTitle: true,
        );
}
