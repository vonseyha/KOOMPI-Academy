import 'package:flutter/material.dart';

class ReuseFormFill extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final FormFieldSetter<String> onsaved;
  final FormFieldValidator<String> validator;
  ReuseFormFill({this.hintText, this.prefixIcon, this.onsaved, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: hintText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      onSaved: onsaved,
      validator: validator,
    );
  }
}
