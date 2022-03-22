import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vivel_mobile/pages/home_page.dart';
import 'package:vivel_mobile/pages/registration_page.dart';
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

  String? userId;

  bool isBusy = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    initAction();
    super.initState();
  }

  Future<void> initAction() async {
    final refreshToken = await storage.read(key: 'refresh_token');

    if (refreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try {
      final response = await appAuth.token(getTokenRequest(refreshToken));

      await storage.write(key: 'refresh_token', value: response!.refreshToken);
      await storage.write(key: 'access_token', value: response.accessToken);
      await storage.write(key: 'id_token', value: response.idToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        userId = parseIdToken(response.idToken!)['sub'];
      });
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      logoutAction();
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
      await storage.write(key: 'access_token', value: result.accessToken);
      await storage.write(key: 'id_token', value: result.idToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        userId = parseIdToken(result.idToken!)['sub'];
      });
    } catch (e, s) {
      print('login error: $e - stack: $s');
      logoutAction();
    }
  }

  Future<void> logoutAction() async {
    setState(() {
      isBusy = true;
    });

    final idToken = await storage.read(key: 'id_token');

    await storage.delete(key: 'access_token');
    await storage.delete(key: 'refresh_token');
    await storage.delete(key: 'id_token');

    try {
      await appAuth.endSession(getEndSessionRequest(idToken));
    } on PlatformException catch (e, s) {
      if (e.message != null && !e.message!.contains('User cancelled flow')) {
        print('login error: $e - stack: $s');
        rethrow;
      }
    }

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
                    ? HomePage(
                        userId: userId!,
                        logout: logoutAction,
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: const Text('Login'),
                              onPressed: loginAction,
                            ),
                            const RegistrationButtonWidget()
                          ],
                        ),
                      )));
  }
}

class RegistrationButtonWidget extends StatelessWidget {
  const RegistrationButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Register'),
      onPressed: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegistrationPage()))
      },
    );
  }
}
