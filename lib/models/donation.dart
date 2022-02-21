class Donation {
  final String donationId;
  final String userId;
  final String? userName;
  final String driveId;
  final String scheduledAt;
  final int amount;
  final String status;
  final String note;
  final int leukocyteCount;
  final int erythrocyteCount;
  final int plateletCount;
  final String createdAt;
  final String updatedAt;
  final String? hospitalName;
  final String? bloodType;

  Donation(
      {required this.donationId,
      required this.userId,
      this.userName,
      required this.driveId,
      required this.scheduledAt,
      required this.amount,
      required this.status,
      required this.note,
      required this.leukocyteCount,
      required this.erythrocyteCount,
      required this.plateletCount,
      required this.createdAt,
      required this.updatedAt,
      this.hospitalName,
      this.bloodType});

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
        donationId: json["donationId"],
        userId: json["userId"],
        userName: json["userName"],
        driveId: json["driveId"],
        scheduledAt: json["scheduledAt"],
        amount: json["amount"] ?? 0,
        status: json["status"],
        note: json["note"] ?? "",
        leukocyteCount: json["leukocyteCount"] ?? 0,
        erythrocyteCount: json["erythrocyteCount"] ?? 0,
        plateletCount: json["plateletCount"] ?? 0,
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        hospitalName: json["hospitalName"],
        bloodType: json["bloodType"]);
  }
}
