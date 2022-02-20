import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/donation.dart';
import 'package:vivel_mobile/pages/my_donations_page.dart';
import 'package:vivel_mobile/widgets/donation_list_item.dart';

class ProfileDonations extends StatelessWidget {
  final String userId;
  final List<Donation> donations;

  const ProfileDonations(
      {Key? key, required this.donations, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              const Text(
                "Latest donations",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              )
            ]),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyDonationsPage(userId: userId),
                        ));
                  },
                  child: Text(
                    "Show all",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 100, 124, 100),
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Column(
        children: donations.map((donation) {
          return Column(
            children: [
              DonationListItemWidget(donation: donation),
              const Divider(
                height: 1,
                color: Colors.grey,
              )
            ],
          );
        }).toList(),
      )
    ]);
  }
}
