import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APIService {
  static Future<List<dynamic>?> Get(String route, dynamic object) async {
    String queryString = Uri(queryParameters: object).query;
    String baseUrl = 'http://vivel.azurewebsites.net/${route}';

    if (object != null) {
      baseUrl = '${baseUrl}?${queryString}';
    }

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body)["results"] as List;
    }

    return null;
  }

  static Future<Map<String, dynamic>?> getSingle(
      String route, dynamic object) async {
    String queryString = Uri(queryParameters: object).query;
    String baseUrl = '${dotenv.env['API_URL']}/$route';

    if (object != null) {
      baseUrl = '$baseUrl?$queryString';
    }

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    }

    return null;
  }

  static Future<dynamic?> Post(String route, dynamic object) async {
    String baseUrl = '${dotenv.env['API_URL']}/$route';

    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(object));

    return response;
  }
}
