class Donation {
  final String donationId;
  final String driveId;
  final String scheduledAt;
  final num amount;
  final String status;
  final String note;
  final num leukocyteCount;
  final num erythrocyteCount;
  final num plateletCount;

  Donation({
    required this.donationId,
    required this.driveId,
    required this.scheduledAt,
    required this.amount,
    required this.status,
    required this.note,
    required this.leukocyteCount,
    required this.erythrocyteCount,
    required this.plateletCount,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      donationId: json["donationId"],
      driveId: json["driveId"],
      scheduledAt: json["scheduledAt"],
      amount: json["amount"] ?? 0,
      status: json["status"],
      note: json["note"] ?? "",
      leukocyteCount: json["leukocyteCount"] ?? 0,
      erythrocyteCount: json["erythrocyteCount"] ?? 0,
      plateletCount: json["plateletCount"] ?? 0,
    );
  }
}
