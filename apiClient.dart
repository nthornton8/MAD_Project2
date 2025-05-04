import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String apiKey = 'YOUR_API_KEY';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Map<String, dynamic>> getWeatherData(String city) async {
    final response = await http.get(Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}