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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomContainer(
              backGroundColor: kDefaultContainerColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    data.getLevel.name,
                    style: TextStyle(
                      fontSize: 30,
                      color: data.getColor,
                    ),
                  ),
                  Text(
                    data.getBMI.toStringAsFixed(1).toString(),
                    style: TextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'You have a ${data.getLevel.name} weight',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        data.getAdvise,
                        style: TextStyle(
                          color: data.getColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('RE-CALCULATE'),
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
