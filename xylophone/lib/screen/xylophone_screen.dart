import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Xylophone_Screen extends StatelessWidget {
  const Xylophone_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SoundButton(buttonColor: Colors.red, soundIndex: 1),
            SoundButton(buttonColor: Colors.orange, soundIndex: 2),
            SoundButton(buttonColor: Colors.yellow, soundIndex: 3),
            SoundButton(buttonColor: Colors.green, soundIndex: 4),
            SoundButton(buttonColor: Colors.blue, soundIndex: 5),
            SoundButton(buttonColor: Colors.indigo, soundIndex: 6),
            SoundButton(buttonColor: Colors.purple, soundIndex: 7),
          ],
        ),
      ),
    );
  }

  Widget SoundButton({required Color buttonColor, required int soundIndex}) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final player = AudioPlayer();
          await player.setSource(AssetSource('note$soundIndex.wav'));
          await player.resume();
        },
        child: Container(
          color: buttonColor,
        ),
      ),
    );
  }
}
