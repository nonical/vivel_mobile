import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/models/badge.dart';
import 'package:vivel_mobile/models/donation.dart';
import 'package:vivel_mobile/models/user_details.dart';
import 'package:vivel_mobile/pages/reset_password.dart';
import 'package:vivel_mobile/services/badge_service.dart';
import 'package:vivel_mobile/services/donation_service.dart';
import 'package:vivel_mobile/services/user_service.dart';
import 'package:vivel_mobile/widgets/navigation_bar/profile_navigation.dart';
import 'package:vivel_mobile/widgets/profile/profile_badges.dart';
import 'package:vivel_mobile/widgets/profile/profile_details.dart';
import 'package:vivel_mobile/widgets/profile/profile_donations.dart';
import 'package:vivel_mobile/widgets/profile/profile_header.dart';

class ProfilePage extends StatefulWidget {
  final String userId;
  const ProfilePage({Key? key, required this.userId}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<UserDetails> details;
  late Future<List<Badge>> badges;
  late Future<List<Donation>> donations;

  @override
  void initState() {
    super.initState();

    details = UserService.getDetails(widget.userId);
    badges =
        BadgeService.get(widget.userId, {"paginate": "true", "pageSize": "2"});
    donations = DonationService.get(
        widget.userId, {"paginate": "true", "pageSize": "3"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ProfileNavigation(context),
        body: FutureBuilder(
          future: Future.wait([details, badges, donations]),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        ProfileHeader(
                            username: snapshot.data![0].userName,
                            verified: snapshot.data![0].verified),
                        ProfileDetails(
                            donationsCount: snapshot.data![0].donationCount,
                            litresDonated: snapshot.data![0].litresDonated,
                            bloodType: snapshot.data![0].bloodType),
                        ProfileBadges(
                            badges: snapshot.data![1] as List<Badge>,
                            userId: widget.userId),
                      ],
                    ),
                  ),
                  ProfileDonations(
                    donations: snapshot.data![2] as List<Donation>,
                    userId: widget.userId,
                  ),
                  Center(
                    heightFactor: 3,
                    child: GestureDetector(
                      child: const Text(
                        'Change Password',
                        style: TextStyle(
                            color: RED, decoration: TextDecoration.underline),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPasswordPage())),
                    ),
                  ),
                ]),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
