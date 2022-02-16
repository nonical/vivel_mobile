import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Column(children: [
          Text("Hello Home"),
          TextButton(
            child: Text("Go to FAQ"),
            onPressed: () => {
              Navigator.of(context).pushNamed("/faq")
            }
          )
        ]));
  }
}
