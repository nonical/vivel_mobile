class UserNotification {
  final String title;
  final String content;
  final String linkId;
  final String linkType;
  final String createdAt;

  UserNotification(
      {required this.title,
      required this.content,
      required this.linkId,
      required this.linkType,
      required this.createdAt});

  factory UserNotification.fromJson(Map<String, dynamic> json) {
    return UserNotification(
        title: json["title"],
        content: json["content"],
        linkId: json["linkId"],
        linkType: json["linkType"],
        createdAt: json["createdAt"]);
  }
}
