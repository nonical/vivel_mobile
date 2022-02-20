import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/pages/profile_page.dart';
import 'package:vivel_mobile/pages/user_notifications_page.dart';

class HomeNavigation extends AppBar {
  HomeNavigation(BuildContext context, {Key? key})
      : super(
          key: key,
          title: const Text("Home"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: RED,
          leading: IconButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationsPage(
                                  userId:
                                      '49649a15-21a8-4048-abb5-2b17f5cb4efa',
                                )))
                  },
              icon: Image.asset('assets/bell.png')),
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage(
                                    userId:
                                        '49649a15-21a8-4048-abb5-2b17f5cb4efa',
                                  )))
                    },
                icon: Image.asset('assets/user.png'))
          ],
        );
}
