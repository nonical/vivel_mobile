import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/widgets/Home/home_header.dart';

class HomeHeaderOne extends StatelessWidget {
  final int totalDonations;
  final String lastDonation;

  const HomeHeaderOne({
    Key? key,
    required this.totalDonations,
    required this.lastDonation,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HomeHeader(
      leftColumn: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: const [
            Expanded(
                child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  "Total donations",
                  style: HEADING5,
                ),
              ),
            ))
          ]),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: Text(totalDonations.toString(),
                          style: HEADING3.copyWith(color: GREEN))))
            ],
          )
        ],
      ),
      rightColumn: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: const [
            Expanded(
                child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text("Last donation", style: HEADING5),
              ),
            ))
          ]),
          Row(
            children: [
              Expanded(
                  child: Center(
                child: Text(lastDonation, style: HEADING3.copyWith(color: RED)),
              ))
            ],
          )
        ],
      ),
    );
  }
}
