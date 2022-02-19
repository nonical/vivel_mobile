import '../models/donation.dart';
import 'api_service.dart';

class DonationService {
  static Future<List<Donation>> get(String userId) async {
    var donations = await APIService.Get('user/$userId/donations', null);

    if (donations != null) {
      return donations.map((x) => Donation.fromJson(x)).toList();
    }

    return <Donation>[];
  }
}
