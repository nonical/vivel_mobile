import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/user_details.dart';
import 'package:vivel_mobile/widgets/home/home_header.dart';

class HomeHeaderTwo extends StatelessWidget {
  final UserDetails userDetails;

  const HomeHeaderTwo({Key? key, required this.userDetails}) : super(key: key);

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
                child: Text(
                    DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(
                        DateTime.parse(userDetails.lastDonation)
                            .add(const Duration(days: 90))),
                    style: HEADING3.copyWith(color: GREEN)),
              ))
            ])
          ],
        ),
      ),
    );
  }
}
