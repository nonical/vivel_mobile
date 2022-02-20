import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/pages/question_page.dart';

class WikiNavigation extends AppBar {
  WikiNavigation(BuildContext context, {Key? key})
      : super(
          key: key,
          title: const Text("Wiki"),
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: BLACK, fontSize: 17),
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
