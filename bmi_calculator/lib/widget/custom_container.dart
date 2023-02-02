import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color backGroundColor;

  const CustomContainer({required this.backGroundColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: backGroundColor,
        ),
      ),
    );
  }
}
