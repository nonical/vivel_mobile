import 'package:flutter/material.dart';
import 'package:vivel_mobile/widgets/NavigationBar/wiki_navigation.dart';

import '../models/faq.dart';
import '../services/faq_service.dart';
import '../widgets/faq.dart';

class WikiPage extends StatefulWidget {
  @override
  _WikiPageState createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: WikiNavigation(context), body: bodyWidget());
  }

  Widget bodyWidget() {
    return FutureBuilder<List<FAQ>>(
      future: FAQService.Get(),
      builder: (BuildContext context, AsyncSnapshot<List<FAQ>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Loading..."),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => Row(),
            itemBuilder: (context, index) => Container(
              color: Colors.white,
              child: Column(
                children: [
                  FAQWidget(faq: snapshot.data![index]),
                  const Divider(
                    height: 0,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text('No data'),
        );
      },
    );
  }
}
