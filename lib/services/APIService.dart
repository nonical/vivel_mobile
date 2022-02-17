import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

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

  static Future<dynamic?> Post(String route, dynamic object) async {
    String baseUrl = 'https://vivel.azurewebsites.net/$route/';

    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(object));

    return response.statusCode;
  }
}
