class FAQ {
  final String faqid;
  final String question;
  final String answer;

  FAQ({required this.faqid, required this.question, required this.answer});

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
        faqid: json["faqid"],
        question: json["question"],
        answer: json["answer"]);
  }
}

class FAQRequest {
  final String question;

  FAQRequest({required this.question});

  Map<String, dynamic> ToJson() => {"question": question};
}
