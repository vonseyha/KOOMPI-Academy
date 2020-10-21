import 'package:flutter/material.dart';
class ReuseMeterialButton extends StatelessWidget {

  final double evaluation;
  final Color color;
  final Widget child;

   ReuseMeterialButton({this.evaluation,this.color,this.child});

  @override
  Widget build(BuildContext context) {
    return  Material(
        elevation: evaluation,
        borderRadius: BorderRadius.circular(30.0),
        color: color,
        child: child,
    );
  }
}