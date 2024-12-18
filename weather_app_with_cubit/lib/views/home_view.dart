import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_cubit/providers/get_weather_provider.dart';
import 'package:weather_app_with_cubit/providers/get_weather_states.dart';
import 'package:weather_app_with_cubit/views/search_view.dart';
import 'package:weather_app_with_cubit/widgets/no_weather_body.dart';
import 'package:weather_app_with_cubit/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        // backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SearchView();
              }));
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherProvider, WeatherState>(
        builder: (context, state) {
          if (state is InitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return const Text('Oops there was an error');
          }
        },
      ),
    );
  }
}
