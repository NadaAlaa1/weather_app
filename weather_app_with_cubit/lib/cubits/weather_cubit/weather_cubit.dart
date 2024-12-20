import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_cubit/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app_with_cubit/models/weather_model.dart';
import 'package:weather_app_with_cubit/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  String? cityName;
  WeatherModel? weatherModel;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      WeatherModel weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
