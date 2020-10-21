import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReuseToastMessage{
  static toastMessage(String massage , Color colorBg , Color colorText){
    return Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: colorBg,
        textColor: colorText
      );
  }
}