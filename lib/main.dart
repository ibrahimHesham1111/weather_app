import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:th_weather_project/cubits/weather_cubit/cubit.dart';
import 'package:th_weather_project/pages/home_page.dart';
import 'package:th_weather_project/provider/weather_provider.dart';
import 'package:th_weather_project/service/weather_service.dart';


void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: WeatherCubit.get(context).weatherModel == null ?  Colors.blue : WeatherCubit.get(context).weatherModel!.getThemeColor()  ,
      ),
      home: HomePage(),
    );
  }
}