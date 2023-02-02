import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderSelector extends StatelessWidget {
  final IconData iconData;
  final String label;
  final GestureTapCallback onTap;

  const GenderSelector({
    required this.iconData,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyText1!.color;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 100,
          ),
          SizedBox(height: 16),
          Text(
            label,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
