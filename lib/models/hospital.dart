class Hospital {
  final String hospitalId;
  final String name;
  final double latitude;
  final double longitude;
  final String createdAt;
  final String? updatedAt;

  Hospital(
      {required this.hospitalId,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.createdAt,
      required this.updatedAt});

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      hospitalId: json["hospitalId"],
      name: json["name"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}
