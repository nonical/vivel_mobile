import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tuple/tuple.dart';
import 'package:vivel_mobile/models/user_notification.dart';
import 'package:vivel_mobile/services/user_notification_service.dart';
import 'package:vivel_mobile/widgets/navigation_bar/back_navigation.dart';
import 'package:vivel_mobile/widgets/user_notification.dart';

class NotificationsPage extends StatefulWidget {
  final String userId;
  var last_read = "";
  NotificationsPage({Key? key, required this.userId}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late Future<Tuple2<List<UserNotification>, String>> notifications;
  final storage = const FlutterSecureStorage();

  Future<Tuple2<List<UserNotification>, String>> notificationsTuple() async {
    final lastRead = await storage.read(key: "last_read_notification");

    final notifications = await UserNotificationService.get(widget.userId);

    await storage.write(
        key: "last_read_notification",
        value: notifications.isNotEmpty
            ? notifications[0].createdAt
            : DateTime.fromMillisecondsSinceEpoch(0).toString());

    return Tuple2(notifications,
        lastRead ?? DateTime.fromMillisecondsSinceEpoch(0).toString());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackNavigation("Notifications"),
        body: FutureBuilder<Tuple2<List<UserNotification>, String>>(
            future: notificationsTuple(),
            builder: (BuildContext context,
                AsyncSnapshot<Tuple2<List<UserNotification>, String>>
                    snapshot) {
              if (snapshot.hasData && snapshot.data!.item1.isNotEmpty) {
                return ListView.separated(
                  itemCount: snapshot.data!.item1.length,
                  separatorBuilder: (context, index) => Row(),
                  itemBuilder: (context, index) => Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        UserNotificationWidget(
                            notification: snapshot.data!.item1[index],
                            userId: widget.userId,
                            lastRead: snapshot.data!.item2),
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
            }));
  }
}
