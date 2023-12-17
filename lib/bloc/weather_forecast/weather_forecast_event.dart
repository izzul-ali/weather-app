part of 'weather_forecast_bloc.dart';

sealed class WeatherForecastEvent extends Equatable {
  const WeatherForecastEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherForecast extends WeatherForecastEvent {
  @override
  List<Object> get props => [];
}
