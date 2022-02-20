import 'package:tuple/tuple.dart';
import 'package:vivel_mobile/models/drive.dart';

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

  static Future<Donation> getById(String donationId) async {
    var donation = await APIService.getSingle('donation/$donationId', null);
    return Donation.fromJson(donation!);
  }

  static Future<Tuple2<Donation, Drive>> getByIdWithDrive(
      String donationId) async {
    var donation = await getById(donationId);
    var drive = await APIService.getSingle('drive/${donation.driveId}', null);

    return Tuple2(donation, Drive.fromJson(drive!));
  }
}
