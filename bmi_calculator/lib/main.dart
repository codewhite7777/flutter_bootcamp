import 'package:bmi_calculator/const/constants.dart';
import 'package:bmi_calculator/screen/bmi_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: kAppBarColor,
        ),
        scaffoldBackgroundColor: kScaffoldBackColor,
      ),
      home: BMI_Screen(),
    );
  }
}
