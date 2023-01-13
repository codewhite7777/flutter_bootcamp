import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomContainer(
              color: Colors.red,
              width: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomContainer(
                  color: Colors.yellow,
                  height: 100,
                  width: 100,
                ),
                CustomContainer(
                  color: Colors.lightGreen,
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            CustomContainer(
              color: Colors.blue,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomContainer(
      {required double width, double height = 0, required Color color}) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
