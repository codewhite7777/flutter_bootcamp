import 'dart:ffi';

import 'package:flutter/material.dart';

class HeightSelector extends StatelessWidget {
  final String label;
  final double currentValue;
  final ValueChanged<double> onChanged;
  final double minHeight;
  final double maxHeight;

  const HeightSelector({
    required this.label,
    required this.currentValue,
    required this.onChanged,
    required this.minHeight,
    required this.maxHeight,
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
              '${currentValue.toStringAsFixed(1)}',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 70,
              ),
            ),
            Text('cm'),
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
