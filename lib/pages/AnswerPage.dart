import 'package:flutter/material.dart';
import 'package:vivel_mobile/widgets/NavigationBar/BackNavigation.dart';

import '../models/FAQ.dart';

class AnswerPage extends StatelessWidget {
  final FAQ faq;

  const AnswerPage({Key? key, required this.faq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackNavigation("Answer"),
        body: Container(
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
                    child: Text(
                      faq.question,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                    child: Text(
                      faq.answer,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
