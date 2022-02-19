import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/user_notification.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserNotificationWidget extends StatelessWidget {
  final UserNotification notification;

  const UserNotificationWidget({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {}, // TODO: add link to notification linkType
      child: Container(
        color: Colors.white,
        height: 130,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset('assets/ellipse.png'),
                    )
                  ],
                )),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: Text(notification.title,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: Text(notification.content),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 20, right: 10),
                            child: Text(
                              timeago.format(
                                  DateTime.parse(notification.createdAt)),
                              style: const TextStyle(fontSize: 8),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/chevron-right.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
