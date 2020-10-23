import 'package:flutter/material.dart';

class ReuseTextFormField extends StatelessWidget {

  final double width;
  final TextEditingController controller;
  final String labelText;
  final Color color;
  final int maxLine;
  final int maxLength;

  ReuseTextFormField({this.width,this.controller,this.labelText,this.color,this.maxLength,this.maxLine});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: new TextFormField(
        controller: controller,
        decoration: new InputDecoration(
          labelText: labelText,
          fillColor: color,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
        ),
        maxLines: maxLine,
        maxLength: maxLength,
      ),
    );
  }
}