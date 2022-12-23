import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            TextButton(
              child: Container(
                color: Colors.red,
                height: 50.0,
                width: 100.0,
              ),
              onPressed: () {
                final player = AudioPlayer();
                player.play(AssetSource('note1.wav'));
              },
            ),
            TextButton(
              child: Container(
                color: Colors.orange,
                height: 50.0,
                width: 100.0,
              ),
              onPressed: () {
                final player = AudioPlayer();
                player.play(AssetSource('note2.wav'));
              },
            ),
            TextButton(
              child: Container(
                color: Colors.yellow,
                height: 50.0,
                width: 100.0,
              ),
              onPressed: () {
                final player = AudioPlayer();
                player.play(AssetSource('note3.wav'));
              },
            ),
            TextButton(
              child: Container(
                color: Colors.green,
                height: 50.0,
                width: 100.0,
              ),
              onPressed: () {
                final player = AudioPlayer();
                player.play(AssetSource('note4.wav'));
              },
            ),
            TextButton(
              child: Container(
                color: Colors.teal,
                height: 50.0,
                width: 100.0,
              ),
              onPressed: () {
                final player = AudioPlayer();
                player.play(AssetSource('note5.wav'));
              },
            ),
            TextButton(
              child: Container(
                color: Colors.blue,
                height: 50.0,
                width: 100.0,
              ),
              onPressed: () {
                final player = AudioPlayer();
                player.play(AssetSource('note6.wav'));
              },
            ),
            TextButton(
              child: Container(
                color: Colors.purple,
                height: 50.0,
                width: 100.0,
              ),
              onPressed: () {
                final player = AudioPlayer();
                player.play(AssetSource('note7.wav'));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
