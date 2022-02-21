import 'package:vivel_mobile/models/hospital.dart';

class Drive {
  final String driveId;
  final String hospitalId;
  final String date;
  final String bloodType;
  final num amount;
  final String status;
  final bool urgency;
  final String createdAt;
  final String updatedAt;
  final Hospital? hospital;

  Drive(
      {required this.driveId,
      required this.hospitalId,
      required this.date,
      required this.bloodType,
      required this.amount,
      required this.status,
      required this.urgency,
      required this.createdAt,
      required this.updatedAt,
      required this.hospital});

  factory Drive.fromJson(Map<String, dynamic> json) {
    return Drive(
        driveId: json["driveId"],
        hospitalId: json["hospitalId"],
        date: json["date"],
        bloodType: json["bloodType"],
        amount: json["amount"],
        status: json["status"],
        urgency: json["urgency"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"] ?? "",
        hospital: Hospital.fromJson(json["hospital"]));
  }
}
