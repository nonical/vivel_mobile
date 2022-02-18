import '../models/badge.dart';
import 'APIService.dart';

class BadgeService {
  static Future<List<Badge>> get(String userId) async {
    var badges = await APIService.Get('user/$userId/badges', null);

    if (badges != null) {
      return badges.map((x) => Badge.fromJson(x)).toList();
    }

    return <Badge>[];
  }
}
