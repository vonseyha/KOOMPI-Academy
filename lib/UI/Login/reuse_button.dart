import 'package:flutter/material.dart';

class ReuseButton {
  static item(String text, Function onPressed, Color color) {
    return RaisedButton(
      onPressed: onPressed,
      color: color,
      child: Text(text),
    );
  }
}
