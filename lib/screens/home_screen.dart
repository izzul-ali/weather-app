import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/current_weather/current_weather_bloc.dart';
import '../bloc/weather_forecast/weather_forecast_bloc.dart';
import '../helper/weather_condition.dart';
import '../widgets/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundApp(),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30),
                BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                  builder: (context, state) {
                    if (state is CurrentWeatherLoading) {
                      return const Expanded(child: CircularProgressIndicator());
                    }

                    if (state is CurrentWeatherError) {
                      return Center(
                        child: Text(state.error),
                      );
                    }

                    if (state is CurrentWeatherSuccess) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 230,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  getWeatherCondition(
                                    state.currentWeather.weather?[0].id ?? 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '${state.currentWeather.main?.temp?.round() ?? '-'}°',
                            style: const TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Precipitations\n',
                              style: const TextStyle(
                                fontSize: 22,
                                fontFamily: 'Poppins',
                                height: 1.5,
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        'Max: ${state.currentWeather.main?.tempMax?.round() ?? '-'}°   Min: ${state.currentWeather.main?.tempMin?.round() ?? '-'}°'),
                              ],
                            ),
                          ),
                        ],
                      );
                    }

                    return const Text('Something went wrong');
                  },
                ),
                const SizedBox(height: 50),
                Image.asset(
                  'assets/images/house.png',
                  scale: 1.2,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff192241),
                          Color(0xff473A92),
                          Color(0xff973AA9),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Today',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              DateFormat('MMMM, dd').format(DateTime.now()),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: BlocBuilder<WeatherForecastBloc,
                              WeatherForecastState>(
                            builder: (context, state) {
                              if (state is WeatherForecastLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (state is WeatherForecastError) {
                                return Center(
                                  child: Text(
                                    state.error,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red,
                                    ),
                                  ),
                                );
                              }

                              if (state is WeatherForecastSuccess) {
                                if ((state.weatherForecast.weatherList ?? [])
                                    .isEmpty) {
                                  return const Center(
                                    child: Text(
                                      'Weather Forecast is Empty',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                }

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: state.weatherForecast.weatherList!
                                      .map(
                                        (weather) => Column(
                                          children: [
                                            Text(
                                              '${weather.main?.temp?.round()}°C',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(
                                              width: 60,
                                              height: 60,
                                              child: Image.asset(
                                                getWeatherCondition(
                                                    weather.weather?[0].id ??
                                                        0),
                                              ),
                                            ),
                                            Text(
                                              DateFormat('HH:MM').format(
                                                DateTime.parse(
                                                  weather.dtTxt ??
                                                      DateTime.now().toString(),
                                                ),
                                              ),
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                );
                              }

                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
