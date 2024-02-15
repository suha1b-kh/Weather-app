import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
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
            var WeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            WeatherCubit.GetWeather(cityName: value);

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
