import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getweathe_cubit/getweather_cubit.dart';
import 'package:weather_app/cubits/getweathe_cubit/getweather_state.dart';
import 'package:weather_app/widgets/noweather_screen.dart';
import 'package:weather_app/widgets/weather_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return  const NoWeatherScreen();
          } else if (state is WeatherLoadedState) {
            return  WeatherScreen(
              weather: state.weatherModel,
            );
          } else {
            return  const Center(child: Text('oops there was an error'));
          }
        },
      ),
    );
  }
}
