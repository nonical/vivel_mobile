class UserDetails {
  final int donationCount;
  final double litresDonated;
  final String lastDonation;
  final String userName;
  final String bloodType;
  final bool verified;

  UserDetails(
      {required this.donationCount,
      required this.litresDonated,
      required this.lastDonation,
      required this.userName,
      required this.bloodType,
      required this.verified});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      donationCount: json["donationCount"],
      litresDonated: json["litresDonated"],
      lastDonation: json["lastDonation"],
      userName: json["userName"],
      bloodType: json["bloodType"],
      verified: json["verified"],
    );
  }
}
