import 'package:flutter/material.dart';
import 'package:vivel_mobile/services/api_service.dart';
import 'package:vivel_mobile/utils/snack_bar.dart';
import 'package:vivel_mobile/widgets/submit_button.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationFormWidget> createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<RegistrationFormWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  void submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String username = usernameEditingController.text;
      String password = passwordEditingController.text;

      final request = {"username": username, "password": password};

      var snackBarText = "Successfully registered";

      try {
        await IdentityAPIService.Post("account/signup", request);
      } on Exception catch (e) {
        print(e);
        snackBarText = e.toString();
      }

      SnackBarUtil.openSnackBar(context, snackBarText);
      // Navigator.pop(context);
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
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextFormField(
                          controller: usernameEditingController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter your username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextFormField(
                          controller: passwordEditingController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter your password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
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
                          text: "Register",
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
