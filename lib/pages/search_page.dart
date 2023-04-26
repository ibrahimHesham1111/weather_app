import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:th_weather_project/cubits/weather_cubit/cubit.dart';

import '../models/weather_model.dart';
import '../provider/weather_provider.dart';
import '../service/weather_service.dart';


class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

            WeatherCubit.get(context).getWeather(cityName: cityName!);


              WeatherCubit.get(context).cityName=cityName;
            Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('search'),
              suffixIcon: GestureDetector(

                  onTap : () async
                  {
                    WeatherService service = WeatherService();

                    WeatherModel? weather =
                    await service.getWeather(cityName: cityName!);

                    Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                    Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
