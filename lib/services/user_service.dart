import '../models/user_details.dart';
import 'api_service.dart';

class UserService {
  static Future<UserDetails> getDetails(String userId) async {
    final details = await APIService.getSingle('user/$userId/details', null);

    return UserDetails.fromJson(details!);
  }
}
