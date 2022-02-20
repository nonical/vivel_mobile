import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:vivel_mobile/services/drive_service.dart';
import 'package:vivel_mobile/widgets/NavigationBar/home_navigation.dart';
import 'package:vivel_mobile/widgets/home_drives.dart';
import 'package:vivel_mobile/widgets/home_header_one.dart';
import 'package:vivel_mobile/widgets/home_header_two.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Drive>> drives;

  @override
  void initState() {
    super.initState();
    // TODO: fetch user details about donations and donation dates
    drives = DriveService.get(); // TODO: fetch only 3-4 active drives
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeNavigation(context),
        body: FutureBuilder(
          future: Future.wait([drives]),
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
                            HomeHeaderOne(
                              totalDonations: 12,
                              lastDonation: "2020-10-03",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 30),
                              child: HomeHeaderTwo(nextDonation: "2020-12-03"),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    HomeDrives(drives: snapshot.data![0])
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
