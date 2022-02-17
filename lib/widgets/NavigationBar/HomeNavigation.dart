import 'package:flutter/material.dart';

class HomeNavigation extends AppBar {
  HomeNavigation()
      : super(
          title: Text("Home"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => {}, icon: Image.asset('assets/bell.png')),
          actions: [
            IconButton(
                onPressed: () => {}, icon: Image.asset('assets/user.png'))
          ],
        );
}
