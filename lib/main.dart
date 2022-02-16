import 'package:flutter/material.dart';
import 'package:vivel_mobile/pages/FAQPage.dart';
import 'package:vivel_mobile/pages/HomePage.dart';
import 'package:vivel_mobile/services/APIService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        "/faq": (context) => FAQPage()
      },
    );
  }
}