import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/widget/custom_container.dart';
import 'package:bmi_calculator/widget/gender_selector.dart';
import 'package:bmi_calculator/widget/slider_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMI_Screen extends StatefulWidget {
  BMI_Screen({Key? key}) : super(key: key);

  @override
  State<BMI_Screen> createState() => _BMI_ScreenState();
}

class _BMI_ScreenState extends State<BMI_Screen> {
  //BMI Data
  GenderType? genderType;
  int age = kMinAge.toInt();
  double height = kMinHeight;
  double weight = kMinWeight;

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
                  CustomContainer(
                    backGroundColor: (genderType == GenderType.male)
                        ? kSelectedContainerColor
                        : kDefaultContainerColor,
                    selectedColor: (genderType == GenderType.male)
                        ? kSelectedBorderColor
                        : kDefaultBorderColor,
                    childWidget: GenderSelector(
                      iconData: FontAwesomeIcons.mars,
                      label: 'MALE',
                      onTap: () {
                        updateGender(GenderType.male);
                      },
                    ),
                  ),
                  CustomContainer(
                    backGroundColor: (genderType == GenderType.female)
                        ? kSelectedContainerColor
                        : kDefaultContainerColor,
                    selectedColor: (genderType == GenderType.female)
                        ? kSelectedBorderColor
                        : kDefaultBorderColor,
                    childWidget: GenderSelector(
                      iconData: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      onTap: () {
                        updateGender(GenderType.female);
                      },
                    ),
                  ),
                ],
              ),
            ),
            CustomContainer(
              backGroundColor: kDefaultContainerColor,
              childWidget: SliderSelector(
                label: 'HEIGHT',
                currentValue: height,
                fontSize: 70,
                unit: 'cm',
                minHeight: kMinHeight,
                maxHeight: kMaxHeight,
                onChanged: onHeightChanged,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  CustomContainer(
                    backGroundColor: kDefaultContainerColor,
                    childWidget: SliderSelector(
                      label: 'WEIGHT',
                      currentValue: weight,
                      unit: 'Kg',
                      minHeight: kMinWeight,
                      maxHeight: kMaxWeight,
                      onChanged: onWeightChanged,
                    ),
                  ),
                  CustomContainer(
                    backGroundColor: kDefaultContainerColor,
                    childWidget: SliderSelector(
                      label: 'AGE',
                      currentValue: age.toDouble(),
                      unit: '',
                      minHeight: kMinAge,
                      maxHeight: kMaxAge,
                      onChanged: onAgeChanged,
                      fractionDigits: 0,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: onCalculate,
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

  void onCalculate() {
    if (genderType == null) {
      showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text('Plase Select your Gender'),
          actions: [
            CupertinoDialogAction(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
              isDestructiveAction: false,
            ),
          ],
        ),
      );
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: builder))
    print('gender : $genderType');
    print('age : $age');
    print('height : ${height.toInt()}');
    print('weight : ${weight.toInt()}');

    return;
  }

  void updateGender(GenderType selectedType) {
    if (selectedType == GenderType.male) {
      setState(() {
        genderType = GenderType.male;
      });
    } else {
      setState(() {
        genderType = GenderType.female;
      });
    }
    print('gender : ${genderType}');
    return;
  }

  void onHeightChanged(double val) {
    setState(() {
      height = val;
    });
  }

  void onWeightChanged(double val) {
    setState(() {
      weight = val;
    });
  }

  void onAgeChanged(double val) {
    setState(() {
      age = val.toInt();
    });
  }
}
