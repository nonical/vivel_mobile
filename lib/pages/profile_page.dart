import 'package:flutter/material.dart';
import 'package:vivel_mobile/widgets/NavigationBar/profile_navigation.dart';
import 'package:vivel_mobile/widgets/profile_badges.dart';
import 'package:vivel_mobile/widgets/profile_details.dart';
import 'package:vivel_mobile/widgets/profile_donations.dart';
import 'package:vivel_mobile/widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileNavigation(),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                const ProfileHeader(username: "Tiana Rosser"),
                const ProfileDetails(
                    donationsCount: 7, litresDonated: 3, bloodType: "O+"),
                const ProfileBadges(),
              ],
            ),
          ),
          ProfileDonations()
        ]),
      ),
    );
  }
}
