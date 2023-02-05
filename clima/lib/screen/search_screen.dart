import 'package:clima/components/back_ground_image.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? searchTarget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundImage(imagePath: 'images/city_background.jpg'),
          SearchPart(),
        ],
      ),
    );
  }

  Widget SearchPart() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchField(onChanged: onSearchFieldChanged),
          GetWeather(onPressed: onGetWeatherPressed),
        ],
      ),
    );
  }

  void onGetWeatherPressed() {
    Navigator.pop(context, searchTarget);
    return;
  }

  void onSearchFieldChanged(String value) {
    searchTarget = value;
    return;
  }

  Widget SearchField({required ValueChanged<String> onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.grey,
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Enter city name',
          icon: Icon(
            Icons.location_city_outlined,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.red,
              width: 20,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }

  Widget GetWeather({required VoidCallback onPressed}) {
    return TextButton(
      child: Text(
        'Get Weather',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
