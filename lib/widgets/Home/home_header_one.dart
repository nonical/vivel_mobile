import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/user_details.dart';
import 'package:vivel_mobile/widgets/home/home_header.dart';

class HomeHeaderOne extends StatelessWidget {
  final UserDetails userDetails;

  const HomeHeaderOne({Key? key, required this.userDetails}) : super(key: key);
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
                      child: Text(userDetails.donationCount.toString(),
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
                child: Text(
                    DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                        .format(DateTime.parse(userDetails.lastDonation)),
                    style: HEADING3.copyWith(color: RED)),
              ))
            ],
          )
        ],
      ),
    );
  }
}
