import 'package:flutter/material.dart';

class WidgetResuse {
  static item(String text, Function onPressed, Color color) {
    return RaisedButton(
      onPressed: onPressed,
      color: color,
      child: Text(text),
    );
  }
  static item1(){
    return Text("Hello World");
  }
}
