class Drive {
  final String driveId;
  final String date;
  final String bloodType;
  final num amount;
  final String status;
  final bool urgency;
  final String createdAt;

  Drive(
      {required this.driveId,
      required this.date,
      required this.bloodType,
      required this.amount,
      required this.status,
      required this.urgency,
      required this.createdAt});

  factory Drive.fromJson(Map<String, dynamic> json) {
    return Drive(
      driveId: json["driveId"],
      date: json["date"],
      bloodType: json["bloodType"],
      amount: json["amount"],
      status: json["status"],
      urgency: json["urgency"],
      createdAt: json["createdAt"],
    );
  }
}
