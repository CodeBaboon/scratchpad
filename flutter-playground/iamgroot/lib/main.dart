import 'package:flutter/material.dart';

void main() {
  const Text title = Text('I am Groot');
  const Color backColor = Colors.black;
  const AssetImage mainImg = AssetImage('images/groot.jpg');

  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: title, backgroundColor: backColor),
    body: const Center(child: Image(image: mainImg)),
  )));
}
