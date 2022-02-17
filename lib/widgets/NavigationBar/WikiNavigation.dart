import 'package:flutter/material.dart';
import 'package:vivel_mobile/pages/QuestionPage.dart';

class WikiNavigation extends AppBar {
  WikiNavigation(BuildContext context)
      : super(
          title: Text("Wiki"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionPage(),
                          )),
                    },
                icon: Image.asset('assets/plus.png'))
          ],
        );
}
