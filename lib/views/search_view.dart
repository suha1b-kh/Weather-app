import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: TextField(
          onSubmitted: (value) async {
            weatherModel =
                await WeatherService(Dio()).getCurrentWeather(cityName: value);

            Navigator.pop(context);
            print(weatherModel!.cityName);
          },
          decoration: InputDecoration(
            hintText: 'Enter city name',
            suffixIcon: Icon(Icons.search),
            labelText: 'Search',
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          ),
        )),
      ),
    );
  }
}
WeatherModel? weatherModel;
