import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Ask Me Anything'),
            backgroundColor: Colors.blue.shade900,
          ),
          body: Magic8Ball(),
        ),
      ),
    );

class Magic8Ball extends StatefulWidget {
  const Magic8Ball({Key key}) : super(key: key);

  @override
  State<Magic8Ball> createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  int answer = 1;

  void AskQuestion() {
    setState(() {
      answer = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  AskQuestion();
                },
                child: Image.asset('images/ball$answer.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
