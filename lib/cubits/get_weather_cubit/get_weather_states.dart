import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class InitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherfailureState extends WeatherState {
  final String errMessage;

  WeatherfailureState(this.errMessage);
}
