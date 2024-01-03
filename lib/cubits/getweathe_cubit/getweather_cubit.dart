import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getweathe_cubit/getweather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/widgets/search_screen.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String city}) async {
    try {
      weatherModel = await WeatherServices(Dio()).getCurrentWeather(city: city);
      emit(WeatherLoadedState(weatherModel!));
    }
    catch (e) {
      emit(WeatherFailureState());
    }
  }
}
