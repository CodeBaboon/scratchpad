import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({required this.color, this.onTap, this.cardChild});

  final Color color;
  final Widget? cardChild;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
