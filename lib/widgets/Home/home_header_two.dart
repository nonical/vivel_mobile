import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/widgets/home/home_header.dart';

class HomeHeaderTwo extends StatelessWidget {
  final String nextDonation;

  const HomeHeaderTwo({Key? key, required this.nextDonation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: HomeHeader(
        leftColumn: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: const [
              Expanded(
                  child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Next donation",
                    style: HEADING3,
                  ),
                ),
              ))
            ]),
            Row(
              children: [
                Expanded(
                    child: Center(
                        child: Text("Earliest you can donate",
                            style: CAPTION1.copyWith(color: GRAY3))))
              ],
            )
          ],
        ),
        rightColumn: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Expanded(
                  child: Center(
                child:
                    Text(nextDonation, style: HEADING3.copyWith(color: GREEN)),
              ))
            ])
          ],
        ),
      ),
    );
  }
}
