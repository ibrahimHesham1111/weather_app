import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:th_weather_project/cubits/weather_cubit/states.dart';
import 'package:th_weather_project/models/weather_model.dart';
import 'package:th_weather_project/service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit(this.weatherService) : super(WeatherInitialState());
  static WeatherCubit get(context)=>BlocProvider.of(context);


WeatherService weatherService;
WeatherModel? weatherModel;

String? cityName;

void getWeather({required String cityName})async
{
  emit(WeatherLoadingState());

  try{
    WeatherModel weatherModel= await weatherService.getWeather(cityName: cityName);
    emit(WeatherSuccessState(weatherModel: weatherModel));
  }on Exception catch(error)
  {
    emit(WeatherErrorState());
  }


}

}