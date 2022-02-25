import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String username;
  final bool verified;

  const ProfileHeader(
      {Key? key, required this.username, required this.verified})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String verifiedDescription = "Your blood type has been verified";
    String notVerifiedDescription = "Your blood type is yet to be verified";

    return SizedBox(
        height: 150,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 100, 124, 100),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/profile-picture.png'))),
              ),
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
                      child: Row(children: [
                        Expanded(
                          child: Text(verified
                              ? verifiedDescription
                              : notVerifiedDescription),
                        ),
                      ]),
                    ),
                  ]),
            )
          ],
        ));
  }
}
