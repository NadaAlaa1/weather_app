import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_cubit/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app_with_cubit/models/weather_model.dart';
import 'package:weather_app_with_cubit/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherLoading());
  WeatherService weatherService;
  WeatherModel? weatherModel;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
