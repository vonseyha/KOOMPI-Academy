import 'package:flutter/material.dart';

class SignupBtn {
  static buildSignupBtn(String text , String btn, Function onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: new Text(
              text,
              style: new TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: new Text(
              "\t${btn}",
              style: new TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
