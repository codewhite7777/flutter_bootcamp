import 'package:clima/components/back_ground_image.dart';
import 'package:clima/constants/constants.dart';
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
          const BackGroundImage(imagePath: 'images/city_background.jpg'),
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
          GetWeatherButton(onPressed: onGetWeatherPressed),
        ],
      ),
    );
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
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: kSearchFieldDecoration,
      ),
    );
  }

  void onGetWeatherPressed() {
    Navigator.pop(context, searchTarget);
    return;
  }

  Widget GetWeatherButton({required VoidCallback onPressed}) {
    final TextStyle? textStyle = Theme.of(context)!.textTheme.bodyText2;
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Get Weather',
        style: textStyle,
      ),
    );
  }
}
