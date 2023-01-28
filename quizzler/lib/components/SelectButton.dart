import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final String buttonContext;
  final Color buttonColor;
  final VoidCallback onPressed;

  const SelectButton(
      {required this.buttonContext,
      required this.buttonColor,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 70),
        backgroundColor: buttonColor,
      ),
      onPressed: onPressed,
      child: Text(buttonContext),
    );
  }
}
