import '../models/user_notification.dart';
import 'api_service.dart';

class UserNotificationService {
  static Future<List<UserNotification>> get(String userId) async {
    var notifications =
        await APIService.Get('user/$userId/notifications', null);

    if (notifications != null) {
      return notifications.map((x) => UserNotification.fromJson(x)).toList();
    }

    return <UserNotification>[];
  }
}
