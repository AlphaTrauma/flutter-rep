import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/weather_response.dart';

part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET('weather')
  Future<WeatherResponse> getWeatherByCity(
    @Query('q') String city,
  );
}
