import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/widgets/card.dart';

class BloodReport extends StatelessWidget {
  final num leukocyteCount;
  final num erythrocyteCount;
  final num plateletCount;
  const BloodReport(
      {Key? key,
      required this.leukocyteCount,
      required this.erythrocyteCount,
      required this.plateletCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      height: 250,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Blood Report',
                style: HEADING6,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Laboratory examination of your blood sample.',
                style: CAPTION1.copyWith(color: GRAY3),
              ),
            )
          ],
        ),
        Column(children: [
          bar('Leukocyte', 'cmm', leukocyteCount, 15000),
          bar('Erythrocyte', 'cmm', erythrocyteCount, 6000000),
          bar('Platelet', 'ml', plateletCount, 400000)
        ])
      ]),
    );
  }
}

Widget bar(String countName, String unit, num amount, num maxAmount) {
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const Text('• ',
              style: TextStyle(color: RED, fontWeight: FontWeight.w900)),
          Text(
            '$countName Count',
            style: CAPTION1.copyWith(color: BLACK),
          )
        ]),
        Text(
          '${NumberFormat.decimalPattern().format(amount)} $unit',
          style: CAPTION1.copyWith(color: BLACK),
        ),
      ],
    ),
    Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: LinearProgressIndicator(
          value: amount / maxAmount,
          color: RED,
          backgroundColor: GRAY4,
        ))
  ]);
}
