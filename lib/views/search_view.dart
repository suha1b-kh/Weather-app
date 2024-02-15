import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search a city',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: TextField(
          onSubmitted: (value) async {
            var weatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            weatherCubit.getWeather(cityName: value);

            Navigator.pop(context);
            // print(weatherModel!.cityName);
          },
          decoration: const InputDecoration(
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
