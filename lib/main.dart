import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getweathe_cubit/getweather_cubit.dart';
import 'package:weather_app/cubits/getweathe_cubit/getweather_state.dart';
import 'package:weather_app/screens/Homescreen.dart';
import 'package:weather_app/widgets/noweather_screen.dart';
import 'package:weather_app/widgets/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetWeatherCubit(),
      child: Builder(
        builder: (BuildContext context)=> MaterialApp(
          theme: ThemeData(
            primarySwatch: getColorTheme(
              BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}



MaterialColor getColorTheme(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  if (condition == 'Sunny' || condition == 'Clear') {
    return Colors.amber;
  } else if (condition == 'Partly cloudy') {
    return Colors.orange;
  } else if (condition == 'Cloudy' ||
      condition == 'Overcast' ||
      condition == 'Fog' ||
      condition == 'Freezing fog') {
    return Colors.grey;
  } else if (condition == 'Mist' ||
      condition == 'Patchy rain possible' ||
      condition == 'Patchy snow possible' ||
      condition == 'Patchy sleet possible' ||
      condition == 'Patchy freezing drizzle possible' ||
      condition == 'Patchy light drizzle' ||
      condition == 'Light drizzle' ||
      condition == 'Patchy light rain' ||
      condition == 'Light rain' ||
      condition == 'Light freezing rain' ||
      condition == 'Light sleet' ||
      condition == 'Patchy light snow' ||
      condition == 'Light snow' ||
      condition == 'Light rain shower' ||
      condition == 'Light sleet showers' ||
      condition == 'Light snow showers' ||
      condition == 'Light showers of ice pellets' ||
      condition == 'Moderate rain at times' ||
      condition == 'Moderate rain' ||
      condition == 'Moderate or heavy freezing rain' ||
      condition == 'Moderate or heavy sleet' ||
      condition == 'Moderate or heavy snow' ||
      condition == 'Moderate or heavy rain shower' ||
      condition == 'Moderate or heavy showers of ice pellets') {
    return Colors.lightBlue;
  } else if (condition == 'Heavy rain at times' ||
      condition == 'Heavy rain' ||
      condition == 'Heavy freezing drizzle' ||
      condition == 'Heavy snow' ||
      condition == 'Torrential rain shower' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Moderate or heavy snow with thunder') {
    return Colors.deepPurple;
  } else if (condition == 'Blowing snow' || condition == 'Blizzard') {
    return Colors.grey;
  }

  return Colors.grey;
}
