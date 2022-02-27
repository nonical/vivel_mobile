import 'dart:convert';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const clientId = 'vivel.mobile';
const clientSecret = '2bc63e15-a44a-42e9-8597-2fcdee8350e0';
const redirectUrl = 'com.nonical.vivel:/callback';
const scopes = ['openid', 'profile', 'scope1', 'offline_access'];

final issuer = dotenv.env['IDENTITY_URL']!;
final discoveryUrl = '$issuer/.well-known/openid-configuration';

final authorizationEndpoint = '$issuer/connect/authorize';
final tokenEndpoint = '$issuer/connect/token';
final endSessionEndpoint = '$issuer/connect/endsession';

final serviceConfiguration = AuthorizationServiceConfiguration(
    authorizationEndpoint: authorizationEndpoint,
    tokenEndpoint: tokenEndpoint,
    endSessionEndpoint: endSessionEndpoint);

AuthorizationTokenRequest getAuthorizationTokenRequest() {
  return AuthorizationTokenRequest(clientId, redirectUrl,
      clientSecret: clientSecret,
      issuer: issuer,
      scopes: scopes,
      allowInsecureConnections: true);
}

TokenRequest getTokenRequest(String? refreshToken) {
  return TokenRequest(clientId, redirectUrl,
      clientSecret: clientSecret,
      refreshToken: refreshToken,
      issuer: issuer,
      allowInsecureConnections: true);
}

Map<String, dynamic> parseIdToken(String idToken) {
  final parts = idToken.split(r'.');
  assert(parts.length == 3);

  return jsonDecode(
      utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
}
