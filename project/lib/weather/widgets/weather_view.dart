import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return const Text('Введите город');
        }

        if (state is WeatherLoading) {
          return const CircularProgressIndicator();
        }

        if (state is WeatherLoaded) {
          return Column(
            children: [
              Text(state.city, style: const TextStyle(fontSize: 24)),
              Text(
                '${state.temperature} °C',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          );
        }

        if (state is WeatherError) {
          return const Text('Произошла ошибка');
        }

        return const SizedBox.shrink();
      },
    );
  }
}
