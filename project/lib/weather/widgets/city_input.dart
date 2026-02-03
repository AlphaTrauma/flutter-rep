import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';

class CityInput extends StatefulWidget {
  const CityInput({super.key});

  @override
  State<CityInput> createState() => _CityInputState();
}

class _CityInputState extends State<CityInput> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    final city = _controller.text.trim();

    if (city.isNotEmpty) {
      context.read<WeatherBloc>().add(FetchWeather(city));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(labelText: 'Введите город'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _submit, child: const Text('Загрузить')),
      ],
    );
  }
}
