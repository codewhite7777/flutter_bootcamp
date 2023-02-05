import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clima/API/open_weather_map_key.dart';
import 'package:clima/components/back_ground_image.dart';
import 'package:clima/model/api_model.dart';
import 'package:clima/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Position? myPosition;
  WeatherModel? myWeatherData;
  bool isTargetSearch = false;
  String searchCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(imagePath: 'images/location_background.jpg'),
          FutureBuilder<WeatherModel>(
            future: getNetworkData(),
            builder:
                (BuildContext context, AsyncSnapshot<WeatherModel> snapshot) {
              if (snapshot.hasData || snapshot.hasError) {
                return RenderingPart();
              }
              return SpinKitFadingCube(
                color: Colors.yellow[100],
              );
            },
          ),
        ],
      ),
    );
  }

  Future<WeatherModel> getNetworkData() async {
    myPosition = await getGeolocatorData();
    if (myPosition == null) throw 'Err : Getting Location data filed.';
    if (isTargetSearch == false) {
      myWeatherData = await getWeatherData(myPosition!);
    } else {
      myWeatherData = await getWeatherData(myPosition!,
          isSearchTarget: isTargetSearch, searchTargetCity: searchCity);
    }
    return myWeatherData!;
  }

  Future<Position> getGeolocatorData() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return pos;
  }

  Future<WeatherModel?> getWeatherData(Position myPos,
      {bool isSearchTarget = false, String searchTargetCity = ''}) async {
    ApiModel weatherModel = ApiModel();
    String getWeatherURL;
    if (isSearchTarget == true) {
      getWeatherURL = weatherModel.getSearchWeatherCall(
          city: searchTargetCity, key: kOpenWeatherMapKey);
    } else {
      getWeatherURL = weatherModel.getCurrentWeatherCall(
          userPosition: myPos, key: kOpenWeatherMapKey);
    }

    Uri url = Uri.parse(getWeatherURL);
    var response = await http.get(url);
    //TODO: it's for debug - request http
    //print(url);
    if (response.statusCode != 200) {
      throw 'Err : Getting Weather data filed.';
    }
    var jsonResponse = convert.jsonDecode(response.body);
    return WeatherModel(
      name: jsonResponse['name'],
      main: jsonResponse['weather'][0]['main'],
      description: jsonResponse['weather'][0]['description'],
      temp: jsonResponse['main']['temp'],
      id: jsonResponse['weather'][0]['id'],
    );
  }

  Widget RenderingPart() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        child: Column(
          children: [
            AppBarPart(
              flex: 1,
              onUpdateLocation: onUpdateLocation,
              onSearchLocation: onSearchLocation,
            ),
            ContentPart(flex: 8),
          ],
        ),
      ),
    );
  }

  void onUpdateLocation() {
    setState(() {
      isTargetSearch = false;
    });
  }

  void onSearchLocation() async {
    final temp = await Navigator.pushNamed(context, '/search');
    if (temp == null) {
      return;
    }
    setState(() {
      isTargetSearch = true;
      searchCity = temp.toString();
    });
  }

  Widget AppBarPart({
    required int flex,
    required VoidCallback onUpdateLocation,
    required VoidCallback onSearchLocation,
  }) {
    return Expanded(
      flex: flex,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onUpdateLocation,
            icon: const Icon(FontAwesomeIcons.locationArrow),
            iconSize: 40,
          ),
          IconButton(
            onPressed: onSearchLocation,
            icon: const Icon(FontAwesomeIcons.treeCity),
            iconSize: 40,
          ),
        ],
      ),
    );
  }

  Widget ContentPart({required int flex}) {
    return Expanded(
      flex: flex,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WeatherIcon(),
            WeatherTemperature(),
            WeatherTip(),
          ],
        ),
      ),
    );
  }

  Widget WeatherIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text(
          getWeatherIcon(myWeatherData!.id),
          style: const TextStyle(fontSize: 70),
          textAlign: TextAlign.right,
        ),
        const SizedBox(width: 10),
        AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText(
              getWeatherDetail(myWeatherData!.id),
            ),
          ],
          isRepeatingAnimation: true,
          repeatForever: true,
          onTap: null,
        ),
      ],
    );
  }

  Widget WeatherTemperature() {
    return Text(
      '${myWeatherData!.temp.toStringAsFixed(1)}°',
      style: const TextStyle(
        fontSize: 80.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget WeatherTip() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${getMessage(myWeatherData!.temp.toInt())}',
          style: const TextStyle(
            fontFamily: 'spartanmb',
            fontSize: 50.0,
          ),
          textAlign: TextAlign.end,
        ),
        (myWeatherData!.name != '')
            ? Text(
                'in\n${myWeatherData!.name}!',
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontFamily: 'spartanmb',
                  fontSize: 50.0,
                ),
              )
            : const Text(''),
      ],
    );
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getWeatherDetail(int condition) {
    if (condition < 300) {
      return 'Thunderstorm';
    } else if (condition < 400) {
      return 'Drizzle';
    } else if (condition < 600) {
      return 'Rain';
    } else if (condition < 700) {
      return 'Snow\️';
    } else if (condition < 800) {
      return 'Atmosphere';
    } else if (condition == 800) {
      return 'Clear️';
    } else if (condition <= 804) {
      return 'Clouds';
    } else {
      return '???';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
