import 'package:flutter/material.dart';
import '../api/dio_client.dart';
import '../api/weather_api.dart';
import '../models/weather_response.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherResponse? weather;
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    try {
      final dio = createDio();
      final api = WeatherApi(dio);

      final result = await api.getWeatherByCity('Tyumen');

      setState(() {
        weather = result;
        loading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (error != null) {
      return Scaffold(body: Center(child: Text(error!)));
    }

    final w = weather!;

    return Scaffold(
      appBar: AppBar(title: const Text('Погода')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wb_sunny, size: 80, color: Colors.red),
            const SizedBox(height: 24),

            Text(
              w.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Text('Широта: ${w.coord.lat}'),
            Text('Долгота: ${w.coord.lon}'),
            const SizedBox(height: 12),
            Text(w.weather.first.main, style: const TextStyle(fontSize: 22)),
            Text(
              w.weather.first.description,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
