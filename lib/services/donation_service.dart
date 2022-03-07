import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:vivel_mobile/models/donation.dart';
import 'package:vivel_mobile/models/drive.dart';
import 'package:vivel_mobile/models/hospital.dart';
import 'package:vivel_mobile/services/api_service.dart';
import 'package:vivel_mobile/services/drive_service.dart';
import 'package:vivel_mobile/services/hospital_service.dart';

class DonationService {
  static Future<List<Donation>> get(String userId, dynamic object) async {
    var donations = await APIService.Get('user/$userId/donations', object);

    if (donations != null) {
      return donations.map((x) => Donation.fromJson(x)).toList();
    }

    return <Donation>[];
  }

  static Future<dynamic> post(dynamic body) async {
    return APIService.Post('donation', body);
  }

  static Future<Donation> getById(String userId, String donationId) async {
    var donation =
        await APIService.getSingle('user/$userId/donation/$donationId', null);
    return Donation.fromJson(donation!);
  }

  static Future<Tuple2<Donation, Drive>> getByIdWithDrive(
      String userId, String donationId) async {
    var donation = await getById(userId, donationId);
    var drive = await DriveService.getById(donation.driveId);

    return Tuple2(donation, drive);
  }

  static Future<Tuple3<Donation, Drive, Hospital>> getByIdWithDriveAndHospital(
      String donationId, String userId) async {
    var donation = await getById(userId, donationId);
    var drive = await DriveService.getById(donation.driveId);
    var hospital = await HospitalService.getById(drive.hospitalId);

    return Tuple3(donation, drive, hospital);
  }
}
