import '../models/badge.dart';
import 'api_service.dart';

class BadgeService {
  static Future<List<Badge>> get(String userId, dynamic object) async {
    var badges = await APIService.Get('user/$userId/badges', object);

    if (badges != null) {
      return badges.map((x) => Badge.fromJson(x)).toList();
    }

    return <Badge>[];
  }
}
