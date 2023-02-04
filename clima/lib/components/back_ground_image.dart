import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  final String imagePath;

  const BackGroundImage({
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}
