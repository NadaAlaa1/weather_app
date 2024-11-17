import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService{
  final Dio dio;

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response = await dio.get('https://api.weatherapi.com/v1/forecast.json?key=033582d57b4f4d48b99173832241711&q=$cityName&days=1');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
} 