import 'package:flutter/material.dart';

class ReuseTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> mValidator;

  ReuseTextField(
      {this.hintText, this.onSaved, this.labelText, this.mValidator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: hintText,
          labelText: labelText,
          prefixIcon: Icon(Icons.alternate_email, color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      onSaved: onSaved,
      validator: mValidator,
    );
  }
}
