import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/model/bmi_model.dart';
import 'package:bmi_calculator/widget/custom_container.dart';
import 'package:flutter/material.dart';

class Result_Screen extends StatelessWidget {
  final BmiModel data;

  const Result_Screen({
    required this.data,
    Key? key,
  }) : super(key: key);

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
        child: CustomContainer(
          backGroundColor: kBackGroundColor,
          childWidget: SizedBox(),
        ),
      ),
    );
  }
}
