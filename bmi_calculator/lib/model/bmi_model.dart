import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class BmiModel {
  double height;
  double weight;
  int age;
  GenderType gender;

  BmiModel({
    required this.height,
    required this.age,
    required this.weight,
    required this.gender,
  });

  double get getBMI {
    return (weight) / ((height / 100) * (height / 100));
  }

  ResultType get getLevel {
    double result = getBMI;
    if (result < 18.5) {
      return ResultType.UnderWeight;
    } else if (result < 23) {
      return ResultType.Nomal;
    } else if (result < 25) {
      return ResultType.OverWeight;
    }
    return ResultType.Obesity;
  }

  String get getAdvise {
    ResultType result = getLevel;
    if (result == ResultType.UnderWeight) {
      return 'Gain some weight!';
    } else if (result == ResultType.Nomal) {
      return 'Good Job!';
    } else if (result == ResultType.OverWeight) {
      return 'Need to lose weight!';
    }
    return 'Need to go to the hospital!!';
  }

  Color get getColor {
    ResultType result = getLevel;
    if (result == ResultType.UnderWeight) {
      return Colors.yellow;
    } else if (result == ResultType.Nomal) {
      return Colors.green;
    } else if (result == ResultType.OverWeight) {
      return Colors.orange;
    } else if (result == ResultType.Obesity) {
      return Colors.red;
    }
    return Colors.black;
  }
}
