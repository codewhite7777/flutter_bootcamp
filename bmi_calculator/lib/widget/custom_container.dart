import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color backGroundColor;
  final Widget childWidget;

  const CustomContainer({
    required this.backGroundColor,
    required this.childWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: childWidget,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: backGroundColor,
        ),
      ),
    );
  }
}
