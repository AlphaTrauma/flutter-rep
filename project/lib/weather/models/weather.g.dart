// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Weather _$WeatherFromJson(Map<String, dynamic> json) => _Weather(
  main: json['main'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$WeatherToJson(_Weather instance) => <String, dynamic>{
  'main': instance.main,
  'description': instance.description,
};
