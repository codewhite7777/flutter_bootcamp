import 'package:clima/screen/main_screen.dart';
import 'package:clima/screen/search_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/search': (context) => SearchScreen(),
      },
      theme: mainTheme,
    );
  }
}

ThemeData mainTheme = ThemeData.dark().copyWith(
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'spartanmb',
    ),
  ),
);
