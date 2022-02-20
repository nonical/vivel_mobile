import '../models/user_details.dart';
import 'api_service.dart';

class UserService {
  static Future<UserDetails> getDetails(String userId) async {
    final details = await APIService.GetObject('user/$userId/details');

    return UserDetails.fromJson(details);
  }
}
