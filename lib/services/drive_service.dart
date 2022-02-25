import 'package:vivel_mobile/utils/location.dart';

import '../models/drive.dart';
import 'api_service.dart';

class DriveService {
  static Future<List<Drive>> get({bool paginate = false, int? pageSize}) async {
    var position = await getPosition();
    var drives = await APIService.Get('drive', {
      "status": "Open",
      "latitude": position.latitude.toString(),
      "longitude": position.longitude.toString(),
      "paginate": "$paginate",
      "pageSize": "$pageSize"
    });

    if (drives != null) {
      return drives.map((x) => Drive.fromJson(x)).toList();
    }

    return <Drive>[];
  }

  static Future<Drive> getById(String driveId) async {
    var donation = await APIService.getSingle('drive/$driveId', null);
    return Drive.fromJson(donation!);
  }
}
