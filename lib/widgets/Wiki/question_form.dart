import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/faq.dart';
import 'package:vivel_mobile/services/faq_service.dart';
import 'package:vivel_mobile/utils/snack_bar.dart';
import 'package:vivel_mobile/widgets/submit_button.dart';

class QuestionFormWidget extends StatefulWidget {
  @override
  State<QuestionFormWidget> createState() => _QuestionFormWidgetState();
}

class _QuestionFormWidgetState extends State<QuestionFormWidget> {
  final formKey = GlobalKey<FormState>();

  TextEditingController questionEditingController = TextEditingController();

  void submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String question = questionEditingController.text;

      final request = FAQRequest(question: question).ToJson();

      var snackBarText = "Successfully saved";

      try {
        await await FAQService.Post(request);
      } on Exception {
        snackBarText = "An error occured";
      }

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
