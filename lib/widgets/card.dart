import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const CardContainer(
      {Key? key,
      required this.child,
      this.height = 180,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 12),
                  blurRadius: 12,
                  color: Color.fromRGBO(50, 50, 71, 0.08)),
              BoxShadow(
                  blurRadius: 24,
                  offset: Offset(0, 16),
                  color: Color.fromRGBO(50, 50, 71, 0.08))
            ]),
        child: child);
  }
}
