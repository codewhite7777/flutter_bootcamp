import 'package:geolocator/geolocator.dart';

class ApiModel {
  ApiModel();

  String getCurrentWeatherCall(
      {required Position userPosition, required String key}) {
    return 'https://api.openweathermap.org/data/2.5/weather?lat=${userPosition.latitude}&lon=${userPosition.longitude}&appid=$key&units=metric';
  }

  String getSearchWeatherCall({required String city, required String key}) {
    return 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key&units=metric';
  }
}
