import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color backGroundColor;
  final Color selectedColor;
  final Widget childWidget;

  const CustomContainer({
    required this.backGroundColor,
    this.selectedColor = Colors.transparent,
    required this.childWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedColor,
          ),
          borderRadius: BorderRadius.circular(16.0),
          color: backGroundColor,
        ),
        child: childWidget,
      ),
    );
  }
}
