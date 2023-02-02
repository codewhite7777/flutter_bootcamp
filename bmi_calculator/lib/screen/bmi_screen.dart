import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/widget/custom_container.dart';
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
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  CustomContainer(backGroundColor: kDefaultContainerColor),
                  CustomContainer(backGroundColor: kDefaultContainerColor),
                ],
              ),
            ),
            CustomContainer(backGroundColor: kDefaultContainerColor),
            Expanded(
              child: Row(
                children: [
                  CustomContainer(backGroundColor: kDefaultContainerColor),
                  CustomContainer(backGroundColor: kDefaultContainerColor),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('CALCULATE'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonColor,
                minimumSize: Size.fromHeight(kButtonMinHeight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
