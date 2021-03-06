import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const SubmitButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(RED),
          minimumSize: MaterialStateProperty.all(const Size(0, 55)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)))),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
