import 'dart:math';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int leftDice = 1;
  int rightDice = 1;

  GestureTapCallback? onDicePressed() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Dicee',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.redAccent[100],
      body: DicePart(),
    );
  }

  Widget DicePart() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Row(
          children: [
            Dice(diceImagePath: 'images/dice$leftDice.png'),
            Dice(diceImagePath: 'images/dice$rightDice.png'),
          ],
        ),
      ),
    );
  }

  Widget Dice({required String diceImagePath}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: GestureDetector(
          child: Image.asset(diceImagePath),
          onTap: onDicePressed,
        ),
      ),
    );
  }
}
