import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../data/weather_api.dart';
import '../../models/current_weather.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final Position position;

  CurrentWeatherBloc({required this.position})
      : super(CurrentWeatherInitial()) {
    on<FetchCurrentWeather>(_onFetchCurrentWeather);
  }

  FutureOr<void> _onFetchCurrentWeather(
      FetchCurrentWeather event, Emitter<CurrentWeatherState> emit) async {
    emit(CurrentWeatherLoading());

    try {
      final http.Response resp = await http.get(Uri.parse(
        WEATHERAPI.currentWeatherApi(
          position.latitude,
          position.longitude,
        ),
      ));

      final CurrentWeather data =
          CurrentWeather.fromJson(jsonDecode(resp.body));

      emit(CurrentWeatherSuccess(currentWeather: data));
    } catch (e) {
      print('error: ${e.toString()}');

      emit(CurrentWeatherError(error: e.toString()));
    }
  }
}
