import 'dart:math';

import 'package:flutter/material.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  int answerNumber = 1;

  GestureTapCallback? onBallPressed() {
    setState(() {
      answerNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ask Me Anything',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: MagicBall(),
      ),
    );
  }

  Widget MagicBall() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: GestureDetector(
          child: Image.asset('images/ball$answerNumber.png'),
          onTap: onBallPressed,
        ),
      ),
    );
  }
}
