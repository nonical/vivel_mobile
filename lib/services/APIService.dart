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
}
