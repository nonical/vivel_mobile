import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/FAQ.dart';
import 'package:vivel_mobile/services/FAQService.dart';
import 'package:vivel_mobile/utils/SnackBarUtil.dart';

class QuestionFormWidget extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController questionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: TextFormField(
            controller: questionEditingController,
            maxLines: 15,
            decoration: InputDecoration(
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
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    String question = questionEditingController.text;

                    final request = FAQRequest(question: question).ToJson();
                    final responseCode = await FAQService.Post(request);

                    final text = (responseCode == 200)
                        ? ("Successfully saved")
                        : ("An error occured");
                    SnackBarUtil.openSnackBar(context, text);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
