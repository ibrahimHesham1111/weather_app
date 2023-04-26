import 'package:th_weather_project/models/weather_model.dart';

abstract class WeatherStates{}

class WeatherInitialState extends WeatherStates{}

class WeatherLoadingState extends WeatherStates{}

class WeatherSuccessState extends WeatherStates{
final WeatherModel weatherModel;

  WeatherSuccessState({required this.weatherModel});

}

class WeatherErrorState extends WeatherStates{

}