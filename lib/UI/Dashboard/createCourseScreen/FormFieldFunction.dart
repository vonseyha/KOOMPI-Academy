import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

//*****************Course Title Field Form*****************/
Widget courseTitleField(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.05,
    child: new TextFormField(
      // controller: _productName,
      decoration: new InputDecoration(
        labelText: "Course Title",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
    ),
  );
}

//*****************Tage Mode Field Form****************/
Widget tageModeField(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.05,
    child: new TextFormField(
      // controller: _productName,
      decoration: new InputDecoration(
        labelText: "Tage Mode",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
    ),
  );
}

//**************Course Description Field Form*************/
Widget courseDescription(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.05,
    child: new TextFormField(
      // controller: _productName,
      decoration: new InputDecoration(
        labelText: "Course Description",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      maxLength: 400,
      maxLines: 5,
    ),
  );
}

//*****************Course Price Form*************/
Widget coursePrice(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: NumberInputWithIncrementDecrement(
        controller: TextEditingController(),
        widgetContainerDecoration: BoxDecoration(
          border: null,
        ),
        onIncrement: (num newlyIncrementedValue) {
          loginToastFail("Course price");
          print('Newly incremented value is $newlyIncrementedValue');
        },
        onDecrement: (num newlyDecrementedValue) {
          print('Newly decremented value is $newlyDecrementedValue');
        },
      ));
}

loginToastFail(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white);
}

//********Display Image Static and from Gellery************/
Widget ImageEmpty() {
  return Container(
    height: 150.0,
    width: 150.0,
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage("images/empty.png"),
    )),
  );
}
