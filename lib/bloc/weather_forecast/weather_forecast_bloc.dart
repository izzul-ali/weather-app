import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../data/weather_api.dart';
import '../../models/weather_forecast.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  final Position position;

  WeatherForecastBloc({required this.position})
      : super(WeatherForecastInitial()) {
    on<FetchWeatherForecast>(_onFetchWeatherForecast);
  }

  FutureOr<void> _onFetchWeatherForecast(
    FetchWeatherForecast event,
    Emitter<WeatherForecastState> emit,
  ) async {
    emit(WeatherForecastLoading());

    try {
      final http.Response resp = await http.get(
        Uri.parse(
          WEATHERAPI.weatherForecastApi(position.latitude, position.longitude),
        ),
      );

      print(jsonDecode(resp.body));

      WeatherForecast data = WeatherForecast.fromJson(jsonDecode(resp.body));

      print("forecast amount ${data.weatherList?.length}");

      data.weatherList = data.weatherList?.where(
        (weather) {
          DateTime weatherTime =
              DateTime.parse(weather.dtTxt ?? DateTime.now().toString());

          return weatherTime.day == DateTime.now().day;
        },
      ).toList();

      emit(WeatherForecastSuccess(weatherForecast: data));
    } catch (e) {
      print('error: ${e.toString()}');

      emit(WeatherForecastError(error: e.toString()));
    }
  }
}
