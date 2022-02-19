import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vivel_mobile/models/badge.dart';
import 'package:vivel_mobile/services/badge_service.dart';
import 'package:vivel_mobile/widgets/badge.dart';
import 'package:vivel_mobile/widgets/NavigationBar/back_navigation.dart';

class BadgesPage extends StatefulWidget {
  final String userId;

  const BadgesPage({Key? key, required this.userId}) : super(key: key);

  @override
  _BadgesPageState createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage> {
  late Future<List<Badge>> badges;

  @override
  void initState() {
    super.initState();
    badges = BadgeService.get(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackNavigation("Badges"),
        body: FutureBuilder<List<Badge>>(
          future: badges,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!
                    .map((e) => BadgeWidget(
                        image: MemoryImage(base64Decode(e.picture)),
                        text: e.name))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
