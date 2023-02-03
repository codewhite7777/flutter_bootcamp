import 'package:bmi_calculator/constants/constants.dart';

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
}
