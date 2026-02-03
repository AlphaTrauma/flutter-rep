abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final String city;
  final int temperature;

  WeatherLoaded({required this.city, required this.temperature});
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
