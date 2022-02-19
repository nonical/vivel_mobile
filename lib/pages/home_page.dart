import 'package:flutter/material.dart';
import 'package:vivel_mobile/pages/active_drives_page.dart';
import 'package:vivel_mobile/pages/badges_page.dart';
import 'package:vivel_mobile/pages/user_notifications_page.dart';
import 'package:vivel_mobile/widgets/NavigationBar/home_navigation.dart';

import 'wiki_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeNavigation(),
        body: Column(children: [
          Text("Hello Home"),
          TextButton(
              child: Text("Go to FAQ"),
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WikiPage()))
                  }),
          TextButton(
              child: Text("Go to Badges"),
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BadgesPage(
                                  userId:
                                      '49649a15-21a8-4048-abb5-2b17f5cb4efa',
                                )))
                  }),
          TextButton(
              child: Text("Go to Notifications"),
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationsPage(
                                  userId:
                                      '49649a15-21a8-4048-abb5-2b17f5cb4efa',
                                )))
                  }),
          TextButton(
              child: Text("Go to Active Drives"),
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ActiveDrivesPage()))
                  })
        ]));
  }
}