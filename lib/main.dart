import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.indigo;
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.blue;
    case 'Patchy light snow':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
      return Colors.lightBlue;
    case 'Blizzard':
      return Colors.grey;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    case 'Ice pellets':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy sleet possible':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;
    case 'Freezing drizzle':
    case 'Patchy freezing drizzle possible':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Heavy freezing drizzle':
      return Colors.teal;
    default:
      return Colors.blue;
  }
}
