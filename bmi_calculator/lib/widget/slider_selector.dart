import 'package:flutter/material.dart';

class SliderSelector extends StatelessWidget {
  final String label;
  final double currentValue;
  final String unit;
  final ValueChanged<double> onChanged;
  final double minHeight;
  final double maxHeight;
  final double fontSize;
  final int fractionDigits;

  const SliderSelector({
    required this.label,
    required this.currentValue,
    required this.unit,
    required this.onChanged,
    required this.minHeight,
    required this.maxHeight,
    this.fontSize = 30,
    this.fractionDigits = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyText1!.color;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 24,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currentValue.toStringAsFixed(fractionDigits),
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: fontSize,
              ),
            ),
            Text(unit),
          ],
        ),
        Slider(
          thumbColor: Colors.redAccent,
          activeColor: Colors.redAccent,
          min: minHeight,
          max: maxHeight,
          value: currentValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
