import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vivel_mobile/constants/text_styles.dart';
import 'package:vivel_mobile/models/user_notification.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:vivel_mobile/pages/donation_page.dart';
import 'package:vivel_mobile/pages/drive_page.dart';

class UserNotificationWidget extends StatelessWidget {
  final UserNotification notification;
  final String userId;

  const UserNotificationWidget(
      {Key? key, required this.notification, required this.userId})
      : super(key: key);

  Widget getLinkable() {
    if (notification.linkType == "Drive") {
      return DrivePage(
        driveId: notification.linkId,
        userId: userId,
      );
    } else {
      return DonationPage(
        donationId: notification.linkId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => getLinkable(),
            ))
      },
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
                      child: SvgPicture.asset('assets/notification-circle.svg'),
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
                          child: Text(notification.title, style: HEADING5),
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
                  SvgPicture.asset('assets/chevron-right.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
