import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:vivel_mobile/models/user_details.dart';
import 'package:vivel_mobile/services/drive_service.dart';
import 'package:vivel_mobile/services/user_service.dart';
import 'package:vivel_mobile/widgets/home/home_drives.dart';
import 'package:vivel_mobile/widgets/home/home_header_one.dart';
import 'package:vivel_mobile/widgets/home/home_header_two.dart';
import 'package:vivel_mobile/widgets/navigation_bar/home_navigation.dart';

class HomePage extends StatefulWidget {
  final String userId;
  final Function logout;

  const HomePage({Key? key, required this.userId, required this.logout})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Drive>> drives;
  late Future<UserDetails> userDetails;

  @override
  void initState() {
    super.initState();

    userDetails = UserService.getDetails(widget.userId);
    drives = DriveService.get(paginate: true, pageSize: 4);
  }

  @override
  Widget build(BuildContext context) {
    final locationUpdate = UserService.updateLocation(widget.userId);

    return Scaffold(
        appBar: HomeNavigation(
          context,
          userId: widget.userId,
        ),
        body: FutureBuilder(
          future: Future.wait([drives, userDetails, locationUpdate]),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60, left: 30, right: 30),
                      child: Column(children: [
                        Column(
                          children: [
                            HomeHeaderOne(userDetails: snapshot.data![1]),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 30),
                              child:
                                  HomeHeaderTwo(userDetails: snapshot.data![1]),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    HomeDrives(
                        drives: snapshot.data![0], userId: widget.userId),
                    Center(
                      heightFactor: 3,
                      child: GestureDetector(
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                              color: RED, decoration: TextDecoration.underline),
                        ),
                        onTap: () => widget.logout(),
                      ),
                    )
                  ],
                ),
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
