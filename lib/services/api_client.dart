import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/restaurant.dart';

class ApiClient {
  static const String baseUrl = 'https://api.example.com/v1';

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      return _getMockData(endpoint);
    } catch (e) {
      return _getMockData(endpoint);
    }
  }

  dynamic _getMockData(String endpoint) {
    if (endpoint.contains('restaurants')) {
      return sampleRestaurants;
    }
    return null;
  }
}
