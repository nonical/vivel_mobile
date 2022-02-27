import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vivel_mobile/pages/home_page.dart';
import 'package:vivel_mobile/utils/oauth_config.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const VivelApp());
}

class VivelApp extends StatefulWidget {
  const VivelApp({Key? key}) : super(key: key);

  @override
  _VivelAppState createState() => _VivelAppState();
}

class _VivelAppState extends State<VivelApp> {
  final appAuth = FlutterAppAuth();
  final storage = const FlutterSecureStorage();

  String userId = '';
  bool isBusy = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    initAction();
  }

  Future<void> initAction() async {
    final refreshToken = await storage.read(key: 'refresh_token');

    if (refreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try {
      final response = await appAuth.token(getTokenRequest(refreshToken));

      storage.write(key: 'refresh_token', value: response!.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        userId = parseIdToken(response.idToken!)['sub'];
      });
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
    }
  }

  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
    });

    try {
      final result = await appAuth
          .authorizeAndExchangeCode(getAuthorizationTokenRequest());

      await storage.write(key: 'refresh_token', value: result!.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
      });
    } catch (e, s) {
      print('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        isLoggedIn = false;
      });
    }
  }

  Future<void> logoutAction() async {
    await storage.delete(key: 'refresh_token');

    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: isBusy
                ? const Center(child: CircularProgressIndicator())
                : isLoggedIn
                    ? HomePage(userId: userId)
                    : Center(
                        child: ElevatedButton(
                          child: const Text('Login'),
                          onPressed: loginAction,
                        ),
                      )));
  }
}
