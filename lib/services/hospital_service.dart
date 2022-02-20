import 'package:vivel_mobile/models/hospital.dart';

import 'api_service.dart';

class HospitalService {
  static Future<Hospital> getById(String hospitalId) async {
    var donation = await APIService.getSingle('hospital/$hospitalId', null);
    return Hospital.fromJson(donation!);
  }
}
