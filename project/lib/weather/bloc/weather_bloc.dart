import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final Random _random = Random();

  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
    FetchWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (event.city.toLowerCase() == 'error') {
        throw Exception('Не удалось загрузить погоду');
      }

      final temperature = _random.nextInt(61) - 30;

      emit(WeatherLoaded(city: event.city, temperature: temperature));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
