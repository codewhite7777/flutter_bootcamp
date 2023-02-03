import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/model/bmi_model.dart';
import 'package:bmi_calculator/screen/result_screen.dart';
import 'package:bmi_calculator/widget/custom_container.dart';
import 'package:bmi_calculator/widget/gender_selector.dart';
import 'package:bmi_calculator/widget/slider_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMI_Screen extends StatefulWidget {
  const BMI_Screen({Key? key}) : super(key: key);

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
    final double appbarFontSize =
        Theme.of(context).textTheme.headlineLarge!.fontSize!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontSize: appbarFontSize,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TopPart(),
            MiddlePart(),
            BottomPart(),
            ButtonPart(),
          ],
        ),
      ),
    );
  }

  Widget TopPart() {
    return Expanded(
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
    );
  }

  Widget MiddlePart() {
    return CustomContainer(
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
    );
  }

  Widget BottomPart() {
    return Expanded(
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
    );
  }

  Widget ButtonPart() {
    return ElevatedButton(
      onPressed: onCalculate,
      style: ElevatedButton.styleFrom(
        backgroundColor: kButtonColor,
        minimumSize: const Size.fromHeight(kButtonMinHeight),
      ),
      child: const Text('CALCULATE'),
    );
  }

  void onCalculate() {
    if (genderType == null) {
      showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Plase Select your Gender'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              isDestructiveAction: false,
              child: const Text('Close'),
            ),
          ],
        ),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result_Screen(
          data: BmiModel(
            age: age,
            height: height,
            weight: weight,
            gender: genderType!,
          ),
        ),
      ),
    );
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
