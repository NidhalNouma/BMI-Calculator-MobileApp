import 'package:flutter/material.dart';

class Cardi extends StatelessWidget {
  final Color clr;
  final Widget child;

  Cardi({@required this.clr, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: child,
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
