import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'bloc/current_weather/current_weather_bloc.dart';
import 'bloc/weather_forecast/weather_forecast_bloc.dart';
import 'helper/location_permission.dart';
import 'screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  final Position currentPosition = await determinePosition();

  runApp(WeatherApp(position: currentPosition));
}

class WeatherApp extends StatelessWidget {
  final Position position;

  const WeatherApp({super.key, required this.position});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrentWeatherBloc(position: position)
            ..add(FetchCurrentWeather()),
        ),
        BlocProvider(
          create: (context) => WeatherForecastBloc(position: position)
            ..add(FetchWeatherForecast()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(),
            bodyMedium: TextStyle(),
          ).apply(
            displayColor: Colors.white,
            bodyColor: Colors.white,
          ),
        ),
        home: const OnBoardingScreen(),
      ),
    );
  }
}
