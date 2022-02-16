import 'package:flutter/material.dart';
import 'package:vivel_mobile/services/APIService.dart';

import '../models/FAQ.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FAQ"),
        ),
        body: bodyWidget());
  }

  Widget bodyWidget() {
    return FutureBuilder<List<FAQ>?>(
      future: getFAQs(),
      builder: (BuildContext context, AsyncSnapshot<List<FAQ>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("Loading..."),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        if (snapshot.hasData) {
          return ListView(
            children: [...?snapshot.data?.map((e) => FAQWidget(e))],
          );
        }
        return Text("No data");
      },
    );
  }

  Future<List<FAQ>?> getFAQs() async {
    var faqs = await APIService.Get("faq", null);
    if (faqs != null) {
      return faqs.map((x) => FAQ.fromJson(x)).toList();
    }
    return <FAQ>[];
  }
}

Widget FAQWidget(FAQ faq) {
  return Card(
    child: Text(faq.question),
  );
}
