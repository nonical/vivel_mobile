import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vivel_mobile/services/api_service.dart';
import 'package:vivel_mobile/utils/snack_bar.dart';
import 'package:vivel_mobile/widgets/submit_button.dart';

import '../widgets/navigation_bar/back_navigation.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController currentPassowordEditingController =
      TextEditingController();
  TextEditingController newPasswordEditingController = TextEditingController();

  void submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String currentPassword = currentPassowordEditingController.text;
      String newPassword = newPasswordEditingController.text;

      final request = {
        "currentPassword": currentPassword,
        "newPassword": newPassword
      };
      var snackBarText = "Successfully changed password";

      try {
        await IdentityAPIService.PostWithAuth("Password", request);
        Navigator.pop(context);
      } on Response catch (e) {
        print(e);
        snackBarText = json.decode(e.body)[0]["description"];
      }

      SnackBarUtil.openSnackBar(context, snackBarText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BackNavigation("Reset Password"),
        body: Container(
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
                              obscureText: true,
                              controller: currentPassowordEditingController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your current password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your current password';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: TextFormField(
                              obscureText: true,
                              controller: newPasswordEditingController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your new password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your new password';
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
                              text: "Change Password",
                              onPressed: () async => submitForm(context),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
