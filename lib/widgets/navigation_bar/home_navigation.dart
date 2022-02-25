import 'package:flutter/material.dart';
import 'package:vivel_mobile/constants/colors.dart';
import 'package:vivel_mobile/pages/profile_page.dart';
import 'package:vivel_mobile/pages/user_notifications_page.dart';

class HomeNavigation extends AppBar {
  HomeNavigation(BuildContext context, {Key? key, required String userId})
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
                            builder: (context) => NotificationsPage(
                                  userId: userId,
                                )))
                  },
              icon: Image.asset('assets/bell.png')),
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                    userId: userId,
                                  )))
                    },
                icon: Image.asset('assets/user.png'))
          ],
        );
}
