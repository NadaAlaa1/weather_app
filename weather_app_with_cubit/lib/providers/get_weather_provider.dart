import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_cubit/models/weather_model.dart';
import 'package:weather_app_with_cubit/providers/get_weather_states.dart';
import 'package:weather_app_with_cubit/services/weather_service.dart';

class GetWeatherProvider extends Cubit<WeatherState> {
  GetWeatherProvider() : super(InitialState());

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      // Use the class-level weatherModel
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherfailureState(e.toString()));
    }
  }
}
