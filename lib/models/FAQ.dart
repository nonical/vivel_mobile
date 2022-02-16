import 'dart:convert';

class FAQ {
  final faqid;
  final question;
  final answer;
  final answered;
  final createdAt;
  final updatedAt;

  FAQ(
      {this.faqid,
      this.question,
      this.answer,
      this.answered,
      this.createdAt,
      this.updatedAt});

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
