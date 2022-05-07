import 'package:vivel_mobile/utils/location.dart';

import '../models/user_details.dart';
import 'api_service.dart';

class UserService {
  static Future<UserDetails> getDetails(String userId) async {
    final details = await APIService.getSingle('user/$userId/details', null);

    return UserDetails.fromJson(details!);
  }

  static Future<void> updateLocation(String userId) async {
    final position = await getPosition();

    APIService.Put('user/$userId',
        {"longitude": position.longitude, "latitude": position.latitude});
  }
}
