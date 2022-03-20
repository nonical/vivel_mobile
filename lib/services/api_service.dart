import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class APIService {
  static Future<http.Response> _get(
      String route, Map<String, dynamic>? queryParameters) async {
    var url = Uri.parse('${dotenv.env['API_URL']}/$route');

    if (queryParameters != null) {
      url = url.replace(queryParameters: queryParameters);
    }

    final accessToken =
        await const FlutterSecureStorage().read(key: 'access_token');

    final res =
        await http.get(url, headers: {'Authorization': 'Bearer $accessToken'});

    if (res.statusCode >= 400) {
      throw Exception(res);
    }

    return res;
  }

  static Future<http.Response> _post(String route, dynamic body) async {
    var url = Uri.parse('${dotenv.env['API_URL']}/$route');
    final accessToken =
        await const FlutterSecureStorage().read(key: 'access_token');

    final res = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode(body));

    if (res.statusCode >= 400) {
      throw Exception(res);
    }

    return res;
  }

  static Future<List<dynamic>?> Get(String route, dynamic object) async {
    final response = await _get(route, object);
    return json.decode(response.body)["results"] as List;
  }

  static Future<Map<String, dynamic>?> getSingle(
      String route, dynamic object) async {
    final response = await _get(route, object);
    return json.decode(response.body) as Map<String, dynamic>;
  }

  static Future<dynamic?> Post(String route, dynamic object) async {
    return _post(route, object);
  }
}

class IdentityAPIService {
  static Future<http.Response> _post(String route, dynamic body) async {
    var url = Uri.parse('${dotenv.env['IDENTITY_URL']}/$route');

    print("body");
    print(jsonEncode(body));

    final res = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));

    print("res");
    print(res);

    if (res.statusCode >= 400) {
      throw Exception(res);
    }

    return res;
  }

  static Future<dynamic?> Post(String route, dynamic object) async {
    return _post(route, object);
  }
}
