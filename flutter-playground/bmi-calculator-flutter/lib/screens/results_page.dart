import 'package:bmi_calculator/components/calculate_button_widget.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/card_widget.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    required this.bmi,
    required this.resultText,
    required this.interpretation,
  });

  final String bmi;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardWidget(
              color: kActiveCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      this.resultText.toUpperCase(),
                      style: kresultTextStyle,
                    ),
                    Text(
                      this.bmi,
                      style: kBMITextStyle,
                    ),
                    Text(
                      this.interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
          ),
          CalculateButtonWidget(
            text: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
