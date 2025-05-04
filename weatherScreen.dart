import 'package:flutter/material.dart';
import 'api_client.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final ApiClient _apiClient = ApiClient();
  String _city = 'Decatur';
  Map<String, dynamic> _weatherData = {};

  void _fetchWeatherData() async {
    try {
      final data = await _apiClient.getWeatherData(_city);
      setState(() {
        _weatherData = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WeatherWise')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter city'),
              onChanged: (text) {
                _city = text;
              },
            ),
            ElevatedButton(
              onPressed: _fetchWeatherData,
              child: Text('Get Weather'),
            ),
            if (_weatherData.isNotEmpty) ...[
              Text('Temperature: ${_weatherData['main']['temp']}°C'),
              Text('Weather: ${_weatherData['weather'][0]['description']}'),
            ],
          ],
        ),
      ),
    );
  }
}
