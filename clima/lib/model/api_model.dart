import 'package:geolocator/geolocator.dart';

class ApiModel {
  ApiModel();

  String getCurrentWeatherCall(
      {required Position userPosition, required String key}) {
    return 'https://api.openweathermap.org/data/2.5/weather?lat=${userPosition.latitude}&lon=${userPosition.longitude}&appid=$key';
  }
}
