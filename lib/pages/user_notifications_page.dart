import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/user_notification.dart';
import 'package:vivel_mobile/services/user_notification_service.dart';
import 'package:vivel_mobile/widgets/navigation_bar/back_navigation.dart';
import 'package:vivel_mobile/widgets/user_notification.dart';

class NotificationsPage extends StatefulWidget {
  final String userId;

  const NotificationsPage({Key? key, required this.userId}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late Future<List<UserNotification>> notifications;

  @override
  void initState() {
    super.initState();
    notifications = UserNotificationService.get(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackNavigation("Notifications"),
        body: FutureBuilder<List<UserNotification>>(
          future: notifications,
          builder: (BuildContext context,
              AsyncSnapshot<List<UserNotification>> snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => Row(),
                itemBuilder: (context, index) => Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      UserNotificationWidget(
                        notification: snapshot.data![index],
                        userId: widget.userId,
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
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
