import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';

class HomeHeader extends StatelessWidget {
  final Widget leftColumn;
  final Widget rightColumn;

  const HomeHeader(
      {Key? key, required this.leftColumn, required this.rightColumn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 12),
                blurRadius: 12,
                color: Color.fromRGBO(50, 50, 71, 0.08)),
            BoxShadow(
                blurRadius: 24,
                offset: Offset(0, 16),
                color: Color.fromRGBO(50, 50, 71, 0.08))
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 90,
      child: Row(children: [
        Expanded(flex: 1, child: leftColumn),
        const VerticalDivider(
          color: GRAY4,
          indent: 15,
          endIndent: 15,
        ),
        Expanded(
          flex: 1,
          child: rightColumn,
        )
      ]),
    );
  }
}
