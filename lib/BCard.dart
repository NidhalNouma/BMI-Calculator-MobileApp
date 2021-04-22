import 'package:flutter/material.dart';
import 'constants.dart';

class BCard extends StatelessWidget {
  final String lbl;
  final int val;
  final Function pressPlus;
  final Function pressMin;

  BCard(this.lbl, this.val, this.pressPlus, this.pressMin);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          lbl,
          style: KTextStyle,
        ),
        Text(
          val.toString(),
          style: KLTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              onPressed: () {
                pressMin();
              },
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            RoundIconButton(
              onPressed: () {
                pressPlus();
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  RoundIconButton({@required this.child, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: child,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
