import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/donation.dart';
import 'package:vivel_mobile/widgets/donation_list_item.dart';

class ProfileDonations extends StatelessWidget {
  final donations = [
    Donation(
        donationId: "123",
        scheduledAt: "123",
        driveId: "123",
        amount: 123,
        status: "Approved",
        erythrocyteCount: 0,
        leukocyteCount: 0,
        plateletCount: 0,
        note: ""),
    Donation(
        donationId: "123",
        scheduledAt: "123",
        driveId: "123",
        amount: 123,
        status: "Approved",
        erythrocyteCount: 0,
        leukocyteCount: 0,
        plateletCount: 0,
        note: ""),
    Donation(
        donationId: "123",
        scheduledAt: "123",
        driveId: "123",
        amount: 123,
        status: "Approved",
        erythrocyteCount: 0,
        leukocyteCount: 0,
        plateletCount: 0,
        note: "")
  ];

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
              children: [Text("Show all")],
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
