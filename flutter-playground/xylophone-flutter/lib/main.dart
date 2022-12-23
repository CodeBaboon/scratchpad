import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneKeyWidget extends StatelessWidget {
  const XylophoneKeyWidget({
    Key? key,
    required this.color,
    required this.note,
  }) : super(key: key);

  final Color color;
  final int note;

  void playSound() {
    final player = AudioPlayer();
    player.play(AssetSource('note$note.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.zero,
          ),
        ),
      ),
      child: Container(),
      onPressed: playSound,
    );
  }
}

class XylophoneApp extends StatelessWidget {
  void playSound(int note) {
    final player = AudioPlayer();
    player.play(AssetSource('note$note.wav'));
  }

  Expanded buildKey({required Color color, required int note}) {
    return Expanded(
      child: XylophoneKeyWidget(
        color: color,
        note: note,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(
                color: Colors.red,
                note: 1,
              ),
              buildKey(
                color: Colors.orange,
                note: 2,
              ),
              buildKey(
                color: Colors.yellow,
                note: 3,
              ),
              buildKey(
                color: Colors.green,
                note: 4,
              ),
              buildKey(
                color: Colors.teal,
                note: 5,
              ),
              buildKey(
                color: Colors.blue,
                note: 6,
              ),
              buildKey(
                color: Colors.purple,
                note: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
