import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String username;

  const ProfileHeader({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 100, 124, 100),
                      shape: BoxShape.circle)),
            ),
            Expanded(
              flex: 8,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Row(children: [
                        Expanded(
                            child: Text(
                          username,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 25),
                      child: Row(children: const [
                        Expanded(
                          child: Text(
                              "Ihello world its a boi alomany from sedewdn"),
                        ),
                      ]),
                    ),
                  ]),
            )
          ],
        ));
  }
}
