import 'package:bmi_calculator/const/constants.dart';
import 'package:flutter/material.dart';

class BMI_Screen extends StatefulWidget {
  const BMI_Screen({Key? key}) : super(key: key);

  @override
  State<BMI_Screen> createState() => _BMI_ScreenState();
}

class _BMI_ScreenState extends State<BMI_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  CustomContainer(),
                  CustomContainer(),
                ],
              ),
            ),
            CustomContainer(),
            Expanded(
              child: Row(
                children: [
                  CustomContainer(),
                  CustomContainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: kContainerBackColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        margin: EdgeInsets.all(8.0),
      ),
    );
  }
}
