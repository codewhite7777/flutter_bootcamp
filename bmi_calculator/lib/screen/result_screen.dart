import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class Result_Screen extends StatelessWidget {
  final ResultType result;

  const Result_Screen({required this.result, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Result',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(),
      ),
    );
  }
}
