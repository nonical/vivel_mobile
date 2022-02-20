import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/widgets/home_header.dart';

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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
              ))
            ]),
            Row(
              children: const [
                Expanded(
                    child: Center(
                        child: Text("Earliest you can donate",
                            style: TextStyle(fontSize: 12, color: GRAY3))))
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
                child: Text(nextDonation,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: GREEN)),
              ))
            ])
          ],
        ),
      ),
    );
  }
}
