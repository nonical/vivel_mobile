import 'package:flutter/material.dart';
import 'package:vivel_mobile/widgets/NavigationBar/BackNavigation.dart';
import 'package:vivel_mobile/widgets/QuestionFormWidget.dart';

class QuestionPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController questionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BackNavigation("Ask a question"),
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topLeft,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
                child: Text(
                  "Your question",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Expanded(flex: 9, child: QuestionFormWidget())
        ]));
  }
}