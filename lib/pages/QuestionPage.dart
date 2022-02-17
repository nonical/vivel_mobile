import 'package:flutter/material.dart';
import 'package:vivel_mobile/widgets/NavigationBar/BackNavigation.dart';
import 'package:vivel_mobile/widgets/QuestionFormWidget.dart';

class QuestionPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController questionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackNavigation("Ask a question"),
        body: Container(
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
                    child: Text(
                      "Your question",
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
                      child: QuestionFormWidget()),
                )
              ],
            )
          ]),
        ));
  }
}
