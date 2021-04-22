import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final String lbl;
  final Function onTap;

  BottomButton({this.lbl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0XFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: containerHeight,
        child: Center(
          child: Text(
            lbl,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
