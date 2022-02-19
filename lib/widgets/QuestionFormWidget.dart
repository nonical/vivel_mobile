import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/FAQ.dart';
import 'package:vivel_mobile/services/FAQService.dart';
import 'package:vivel_mobile/utils/SnackBarUtil.dart';

import 'SubmitButton.dart';

class QuestionFormWidget extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController questionEditingController = TextEditingController();

  void submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String question = questionEditingController.text;

      final request = FAQRequest(question: question).ToJson();
      final response = await FAQService.Post(request);

      final snackBarText = (response.statusCode == 200)
          ? ("Successfully saved")
          : ("An error occured");

      SnackBarUtil.openSnackBar(context, snackBarText);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: questionEditingController,
                    maxLines: 25,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'type your question here...',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: SubmitButton(
                          text: "Submit",
                          onPressed: () async => submitForm(context),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
