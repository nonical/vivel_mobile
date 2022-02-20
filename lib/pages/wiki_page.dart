import 'package:flutter/material.dart';
import 'package:vivel_mobile/widgets/NavigationBar/wiki_navigation.dart';

import '../models/faq.dart';
import '../services/faq_service.dart';
import '../widgets/Wiki/faq.dart';

class WikiPage extends StatefulWidget {
  const WikiPage({Key? key}) : super(key: key);

  @override
  _WikiPageState createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  late Future<List<FAQ>> faqs;

  @override
  void initState() {
    super.initState();
    faqs = FAQService.Get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WikiNavigation(context),
        body: FutureBuilder<List<FAQ>>(
          future: faqs,
          builder: (BuildContext context, AsyncSnapshot<List<FAQ>> snapshot) {
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
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
