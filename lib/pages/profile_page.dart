import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/badge.dart';
import 'package:vivel_mobile/models/donation.dart';
import 'package:vivel_mobile/models/user_details.dart';
import 'package:vivel_mobile/services/badge_service.dart';
import 'package:vivel_mobile/services/donation_service.dart';
import 'package:vivel_mobile/services/user_service.dart';
import 'package:vivel_mobile/widgets/NavigationBar/profile_navigation.dart';
import 'package:vivel_mobile/widgets/profile_badges.dart';
import 'package:vivel_mobile/widgets/profile_details.dart';
import 'package:vivel_mobile/widgets/profile_donations.dart';
import 'package:vivel_mobile/widgets/profile_header.dart';

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
    badges = BadgeService.get(widget.userId); // TODO: fetch only 2 badges
    donations =
        DonationService.get(widget.userId); // TODO: fetch only 2-3 donations
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ProfileNavigation(),
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
                        const ProfileHeader(username: "Tiana Rosser"),
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
                  )
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
