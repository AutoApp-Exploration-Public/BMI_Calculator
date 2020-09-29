import 'file:///C:/Users/AutoA/AndroidStudioProjects/bmi-calculator-flutter/lib/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reuseable_card.dart';
import '../components/icon_content.dart';
import '../components/constant.dart';
import '../components/buttom_button.dart';
import 'Calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR  '),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusebleCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kUnuseableCardColour
                      : kReuseableCardColor,
                  cardChild: IconContent(
                    label: 'MALE',
                    icon: FontAwesomeIcons.male,
                  ),
                ),
              ),
              Expanded(
                child: ReusebleCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kUnuseableCardColour
                      : kReuseableCardColor,
                  cardChild: IconContent(
                    label: 'FEMALE',
                    icon: FontAwesomeIcons.female,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusebleCard(
              colour: kReuseableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xffe56788),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffB15555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        max: 230.0,
                        min: 100.0,
                        activeColor: Color(0xff398765),
                        inactiveColor: Color(0xff765543),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusebleCard(
                      colour: kReuseableCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xffe56788),
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: Color(0xff4C4f5E),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                backgroundColor: Color(0xff4C4f5E),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ReusebleCard(
                      colour: kReuseableCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xffe56788),
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: Color(0xff4C4f5E),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              FloatingActionButton(
                                  backgroundColor: Color(0xff4C4f5E),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Color(0xffffffff),
                                  ))
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          ButtomButton(
              buttonTitle: 'Calculate',
              onTap: () {
                CalculatorBrain cal =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(
                        bmiResult: cal.calculateBMI(),
                        resultText: cal.getResult(),
                        interpretation: cal.getInterpretation(),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
