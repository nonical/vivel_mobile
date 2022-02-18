class Badge {
  final String name;
  final String description;
  final String picture;
  final String createdAt;

  Badge(
      {required this.name,
      required this.description,
      required this.picture,
      required this.createdAt});

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      name: json["name"],
      description: json["description"],
      picture: json["picture"],
      createdAt: json["createdAt"],
    );
  }
}
