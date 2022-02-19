import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  final int donationsCount;
  final double litresDonated;
  final String bloodType;

  const ProfileDetails(
      {Key? key,
      required this.donationsCount,
      required this.litresDonated,
      required this.bloodType})
      : super(key: key);

  Widget detailDescriptionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }

  Widget detailsText(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(width: 1, color: Colors.grey),
            bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(children: [
            detailsText(donationsCount.toString()),
            detailDescriptionText("Donations")
          ]),
          Column(children: [
            detailsText(litresDonated.toString()),
            detailDescriptionText("Litres donated")
          ]),
          Column(children: [
            detailsText(bloodType),
            detailDescriptionText("Blood type")
          ]),
        ]),
      ),
    );
  }
}
