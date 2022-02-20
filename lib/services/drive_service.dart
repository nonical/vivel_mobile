import '../models/drive.dart';
import 'api_service.dart';

class DriveService {
  static Future<List<Drive>> get() async {
    var notifications = await APIService.Get('drive', {"status": "Open"});

    if (notifications != null) {
      return notifications.map((x) => Drive.fromJson(x)).toList();
    }

    return <Drive>[];
  }

  static Future<Drive> getById(String driveId) async {
    var donation = await APIService.getSingle('drive/$driveId', null);
    return Drive.fromJson(donation!);
  }
}
