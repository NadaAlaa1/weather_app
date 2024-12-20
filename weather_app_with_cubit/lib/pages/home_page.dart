import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_with_cubit/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app_with_cubit/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app_with_cubit/models/weather_model.dart';
import 'package:weather_app_with_cubit/pages/search_page.dart';
import 'package:weather_app_with_cubit/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccess) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 3,
                ),
                Text(
                  Provider.of<WeatherProvider>(context).cityName!,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'updated at: ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(weatherData!.getImage()),
                    Text(
                      weatherData!.temp.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        Text('maxTemp: ${weatherData!.maxTemp.toInt()}'),
                        Text('minTemp: ${weatherData!.minTemp.toInt()}'),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  weatherData!.weatherStateName,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
              ],
            ),
          );
        } else if (state is WeatherFailure) {
          return const Center(
            child: Text(
              'Something went wrong, please try again.',
            ),
          );
        } else {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'there is no weather 😔',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'searching now 🔍',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
