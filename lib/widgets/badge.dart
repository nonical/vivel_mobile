import 'package:flutter/material.dart';
import 'package:vivel_mobile/widgets/card.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({Key? key, required this.image, required this.text})
      : super(key: key);

  final ImageProvider<Object> image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        children: [
          Expanded(
              child: Center(
                  child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle, image: DecorationImage(image: image)),
          ))),
          Expanded(child: Center(child: Text(text)))
        ],
      ),
    );
  }
}
