import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundImage(imagePath: 'images/location_background.jpg'),
          SafeArea(
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
                            print('MyLocation Button');
                          },
                          icon: Icon(FontAwesomeIcons.locationArrow),
                          iconSize: 40,
                          hoverColor: Colors.red,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/search');
                            print('Search Button');
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
                          IconButton(
                            icon: BoxedIcon(WeatherIcons.sunrise,
                                size: 25, color: Colors.yellow),
                            onPressed: null,
                          ),
                          Text('12°'),
                          Text(
                            'Bring a 🧥 just \nin case in\n Seoul!',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'spartanmb',
                              fontSize: 50.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackGroundImage extends StatelessWidget {
  final String imagePath;

  const BackGroundImage({
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}
