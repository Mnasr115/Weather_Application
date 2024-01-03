

class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double averageTemp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.averageTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse( json['current']['last_updated']),
      averageTemp: json['forecast']['forecastday']['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}

