import 'package:flutter/material.dart';
import 'package:vivel_mobile/widgets/NavigationBar/WikiNavigation.dart';

import '../models/FAQ.dart';
import '../services/FAQService.dart';
import '../widgets/FAQWidget.dart';

class WikiPage extends StatefulWidget {
  @override
  _WikiPageState createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: WikiNavigation(), body: bodyWidget());
  }

  Widget bodyWidget() {
    return FutureBuilder<List<FAQ>>(
      future: FAQService.Get(),
      builder: (BuildContext context, AsyncSnapshot<List<FAQ>> snapshot) {
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
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => Row(),
            itemBuilder: (context, index) => Column(
              children: [
                FAQWidget(faq: snapshot.data![index]),
                Divider(
                  color: Colors.grey,
                )
              ],
            ),
          );
        }
        return Center(
          child: Text('No data'),
        );
      },
    );
  }
}
