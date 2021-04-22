import 'package:bmi_calculator/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Gender.dart';
import 'Cardi.dart';
import 'BCard.dart';
import 'constants.dart';
import 'ResultPage.dart';
import 'BottomButton.dart';
import 'CalculatorBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactivColor;
  Color femaleColor = inactivColor;
  int height = 180;
  int weight = 60;
  int age = 22;

  void genderClick(bool isMale) {
    if (isMale && maleColor == inactivColor) {
      setState(() {
        maleColor = activColor;
        femaleColor = inactivColor;
      });
    } else if (!isMale && femaleColor == inactivColor) {
      setState(() {
        femaleColor = activColor;
        maleColor = inactivColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      genderClick(true);
                      print('Male');
                    },
                    child: Cardi(
                      clr: maleColor,
                      child: Gender(
                        FontAwesomeIcons.mars,
                        'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      genderClick(false);
                      print('Female');
                    },
                    child: Cardi(
                      clr: femaleColor,
                      child: Gender(
                        FontAwesomeIcons.venus,
                        'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Cardi(
              clr: Color(0XFF1D1E33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: KTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        height.toString(),
                        style: KLTextStyle,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'cm',
                        style: KTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 260.0,
                      onChanged: (double val) {
                        setState(() {
                          height = val.round();
                        });
                      },
                      inactiveColor: Color(0XFF8D8E89),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cardi(
                    clr: Color(0XFF1D1E33),
                    child: BCard(
                      'WEIGHT',
                      weight,
                      () {
                        print(' Weaight +');
                        setState(() {
                          weight++;
                        });
                      },
                      () {
                        print('wheit -');
                        setState(() {
                          weight--;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Cardi(
                    clr: Color(0XFF1D1E33),
                    child: BCard(
                      'AGE',
                      age,
                      () {
                        print('age +');
                        setState(() {
                          age++;
                        });
                      },
                      () {
                        print('age -');
                        setState(() {
                          age--;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            lbl: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    result: calc.calculate(),
                    txt: calc.result(),
                    feadback: calc.feadback(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
