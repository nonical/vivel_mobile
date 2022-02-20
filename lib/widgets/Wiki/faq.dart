import 'package:flutter/material.dart';
import '../../models/faq.dart';
import '../../pages/answer_page.dart';

class FAQWidget extends StatelessWidget {
  final FAQ faq;

  const FAQWidget({Key? key, required this.faq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnswerPage(faq: faq),
            )),
      },
      child: Container(
        color: Colors.white,
        height: 130,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset('assets/help-circle.png'),
                    )
                  ],
                )),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: Text(faq.question,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: Text(faq.answer),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/chevron-right.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
