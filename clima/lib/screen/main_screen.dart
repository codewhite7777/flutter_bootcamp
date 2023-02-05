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
          BackGroundImage(imagePath: 'images/location_background.jpg'),
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
      //TODO : delete comment
      print('search called');
      print('${myWeatherData!.name}');
    }
    //TODO : delete comment
    print('initNetwork called');
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
    //TODO: delete comment
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isTargetSearch = false;
                      });
                    },
                    icon: Icon(FontAwesomeIcons.locationArrow),
                    iconSize: 40,
                    hoverColor: Colors.red,
                  ),
                  IconButton(
                    onPressed: () async {
                      final temp =
                          await Navigator.pushNamed(context, '/search');
                      if (temp == null) {
                        //TODO : delete comment
                        //print('Invaild City ');
                        return;
                      }
                      setState(() {
                        isTargetSearch = true;
                        searchCity = temp.toString();
                      });
                    },
                    icon: Icon(FontAwesomeIcons.treeCity),
                    iconSize: 40,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          getWeatherIcon(myWeatherData!.id),
                          style: TextStyle(fontSize: 70),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(width: 10),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                    ),
                    Text(
                      '${myWeatherData!.temp.toStringAsFixed(1)}°',
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${getMessage(myWeatherData!.temp.toInt())}',
                          style: TextStyle(
                            fontFamily: 'spartanmb',
                            fontSize: 50.0,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        (myWeatherData!.name != '')
                            ? Text(
                                'in\n${myWeatherData!.name}!',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontFamily: 'spartanmb',
                                  fontSize: 50.0,
                                ),
                              )
                            : Text(''),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
