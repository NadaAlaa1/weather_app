import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_with_cubit/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app_with_cubit/pages/home_page.dart';
import 'package:weather_app_with_cubit/providers/weather_provider.dart';
import 'package:weather_app_with_cubit/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
        //     ? Colors.blue
        //     : Provider.of<WeatherProvider>(context)
        //         .weatherData!
        //         .getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
