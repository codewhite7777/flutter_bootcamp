import 'package:flutter/material.dart';
import 'package:i_am_a_cat/screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'I am a cat',
      home: HomeScreen(),
    );
  }
}
