import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Xylophone_Screen extends StatelessWidget {
  const Xylophone_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, Map<Color, int>> soundData = {
      '도': {Colors.red: 1},
      '레': {Colors.orange: 2},
      '미': {Colors.yellow: 3},
      '파': {Colors.green: 4},
      '솔': {Colors.blue: 5},
      '라': {Colors.indigo: 6},
      '시': {Colors.purple: 7},
    };

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: soundData.entries
              .map(
                (e) => SoundButton(
                  soundName: e.key,
                  buttonColor: e.value.entries.first.key,
                  soundIndex: e.value.entries.last.value,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget SoundButton({
    required String soundName,
    required Color buttonColor,
    required int soundIndex,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final player = AudioPlayer();
          await player.setSource(AssetSource('note$soundIndex.wav'));
          await player.resume();
        },
        child: Container(
          color: buttonColor,
          child: Text(
            soundName,
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}
