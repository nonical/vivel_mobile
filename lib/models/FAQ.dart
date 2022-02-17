import 'dart:convert';

class FAQ {
  final String faqid;
  final String question;
  final String answer;
  final bool answered;
  final String createdAt;
  final String updatedAt;

  FAQ(
      {required this.faqid,
      required this.question,
      required this.answer,
      required this.answered,
      required this.createdAt,
      required this.updatedAt});

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
        faqid: json["faqid"],
        question: json["question"],
        answer: json["answer"],
        answered: json["answered"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"]);
  }
}
