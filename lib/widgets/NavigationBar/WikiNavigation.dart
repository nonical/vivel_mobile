import 'package:flutter/material.dart';

class WikiNavigation extends AppBar {
  WikiNavigation()
      : super(
          title: Text("Wiki"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => {}, icon: Image.asset('assets/plus.png'))
          ],
        );
}
