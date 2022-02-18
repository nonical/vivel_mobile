import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({Key? key, required this.image, required this.text})
      : super(key: key);

  final ImageProvider<Object> image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 40),
        // this container can probably be extracted as a Card widget
        child: Container(
            height: 180,
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
            child: Column(
              children: [
                Expanded(
                    child: Center(
                        child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: image)),
                ))),
                Expanded(child: Center(child: Text(text)))
              ],
            )));
  }
}
