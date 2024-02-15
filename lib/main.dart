import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return GetWeatherCubit();
      },
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    backgroundColor: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition),
                  ),
                ),
                home: const HomeView());
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null)
    return Colors.blue;
  else {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Colors.orange;
      case 'cloudy':
        return Colors.grey;
      case 'overcast':
        return Colors.blueGrey;
      case 'mist':
        return Colors.teal;
      case 'partly cloudy':
      case 'rain':
      case 'patchy rain':
      case 'light rain':
      case 'moderate rain':
      case 'heavy rain':
      case 'snow':
      case 'patchy snow':
      case 'light snow':
      case 'moderate snow':
      case 'heavy snow':
      case 'fog':
      case 'blizzard':
        return Colors.blue;
      case 'sleet':
      case 'patchy sleet':
      case 'light sleet':
      case 'moderate sleet':
      case 'freezing drizzle':
        return Colors.lightBlue;
      case 'thunderstorms':
        return Colors.purple;
      default:
        return Colors.grey; // Default color
    }
  }
}
