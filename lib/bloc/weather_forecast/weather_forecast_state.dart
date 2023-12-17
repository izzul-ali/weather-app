part of 'weather_forecast_bloc.dart';

sealed class WeatherForecastState extends Equatable {
  const WeatherForecastState();

  @override
  List<Object> get props => [];
}

final class WeatherForecastInitial extends WeatherForecastState {
  @override
  List<Object> get props => [];
}

final class WeatherForecastLoading extends WeatherForecastState {
  @override
  List<Object> get props => [];
}

final class WeatherForecastError extends WeatherForecastState {
  final String error;

  const WeatherForecastError({this.error = 'Something went wrong!'});

  @override
  List<Object> get props => [];
}

final class WeatherForecastSuccess extends WeatherForecastState {
  final WeatherForecast weatherForecast;

  const WeatherForecastSuccess({required this.weatherForecast});

  @override
  List<Object> get props => [];
}
