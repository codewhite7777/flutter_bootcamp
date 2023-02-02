import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/screen/bmi_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      home: BMI_Screen(),
    );
  }

  ThemeData getThemeData() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: kBackGroundColor,
      appBarTheme: AppBarTheme(
        color: kBackGroundColor,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: kDefaultTextColor,
        ),
      ),
    );
  }
}
