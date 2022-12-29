import 'package:flutter/material.dart';
import '../constants.dart';

class CardIconWidget extends StatelessWidget {
  const CardIconWidget({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
