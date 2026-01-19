import 'package:freezed_annotation/freezed_annotation.dart';
import 'coord.dart';
import 'weather.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
abstract class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse({
    required Coord coord,
    required List<Weather> weather,
    required String name,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
