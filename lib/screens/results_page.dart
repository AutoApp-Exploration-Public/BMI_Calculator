import 'file:///C:/Users/AutoA/AndroidStudioProjects/bmi-calculator-flutter/lib/components/constant.dart';
import 'file:///C:/Users/AutoA/AndroidStudioProjects/bmi-calculator-flutter/lib/components/reuseable_card.dart';
import 'package:bmi_calculator/components/buttom_button.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kResult,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusebleCard(
                colour: kReuseableCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultMain,
                    ),
                    Text(
                      bmiResult,
                      style: kResultInt,
                    ),
                    Text(
                      interpretation,
                      style: kResultText,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            ButtomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return InputPage();
                      },
                    ),
                  );
                },
                buttonTitle: 'Re-Calculate'),
          ],
        ));
  }
}
