part of 'current_weather_bloc.dart';

sealed class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object> get props => [];
}

final class CurrentWeatherInitial extends CurrentWeatherState {
  @override
  List<Object> get props => [];
}

final class CurrentWeatherLoading extends CurrentWeatherState {
  @override
  List<Object> get props => [];
}

final class CurrentWeatherError extends CurrentWeatherState {
  final String error;

  const CurrentWeatherError({this.error = 'Something went wrong!'});

  @override
  List<Object> get props => [error];
}

final class CurrentWeatherSuccess extends CurrentWeatherState {
  final CurrentWeather currentWeather;

  const CurrentWeatherSuccess({required this.currentWeather});

  @override
  List<Object> get props => [currentWeather];
}
