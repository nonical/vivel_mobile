import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/donation.dart';

class DonationListItemWidget extends StatelessWidget {
  final Donation donation;

  const DonationListItemWidget({Key? key, required this.donation})
      : super(key: key);

  Widget statusText(String status) {
    Color textColor = Color.fromRGBO(153, 153, 153, 100);

    switch (status) {
      case "Approved":
        textColor = const Color.fromRGBO(0, 196, 140, 100);
        break;
      case "Rejected":
        textColor = const Color.fromRGBO(255, 100, 124, 100);
        break;
      case "Scheduled":
        textColor = const Color.fromRGBO(242, 153, 74, 100);
        break;
    }
    return (Text(status, style: TextStyle(color: textColor)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {}, // TODO: add link to donation page
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
                          color: Color.fromRGBO(255, 100, 124, 100),
                          shape: BoxShape.circle),
                      child: Center(child: Image.asset('assets/activity.png')),
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
                          child: Text("DZ Hospital",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500)),
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
                  Image.asset('assets/chevron-right.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
