import 'package:flutter/material.dart';
import 'package:vivel_mobile/pages/QuestionPage.dart';

class WikiNavigation extends AppBar {
  WikiNavigation(BuildContext context)
      : super(
          title: Text("Wiki"),
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 17),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
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
