import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  final Color dankPurple = Color(0xFF0A0E21);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: dankPurple,
        scaffoldBackgroundColor: dankPurple,
      ),
      home: InputPage(),
    );
  }
}
