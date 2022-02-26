import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/donation.dart';
import 'package:vivel_mobile/pages/donation_page.dart';

class DonationListItemWidget extends StatelessWidget {
  final Donation donation;

  const DonationListItemWidget({Key? key, required this.donation})
      : super(key: key);

  Widget statusText(String status) {
    Color textColor = GRAY3;

    switch (status) {
      case "Approved":
        textColor = GREEN;
        break;
      case "Rejected":
        textColor = RED;
        break;
      case "Scheduled":
        textColor = ORANGE;
        break;
    }
    return (Text(status, style: TextStyle(color: textColor)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DonationPage(donationId: donation.donationId),
            ))
      },
      child: Container(
        color: Colors.white,
        height: 88,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                          color: RED, shape: BoxShape.circle),
                      child: Center(
                          child: SvgPicture.asset('assets/activity.svg')),
                    )
                  ],
                )),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 10),
                          child: Text("DZ Hospital", style: HEADING5),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: statusText(donation.status),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/chevron-right.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
