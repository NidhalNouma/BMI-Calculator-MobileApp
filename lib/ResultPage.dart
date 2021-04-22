import 'package:bmi_calculator/Cardi.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'Cardi.dart';
import 'BottomButton.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String txt;
  final String feadback;

  ResultPage({this.result, this.txt, this.feadback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(14),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result:',
                style: KRTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Cardi(
                clr: activColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      txt.toUpperCase(),
                      style: KRETextStyle,
                    ),
                    Text(
                      result,
                      style: KLTextStyle,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: Text(
                        feadback,
                        textAlign: TextAlign.center,
                        style: KTextStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            lbl: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
