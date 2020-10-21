import 'package:flutter/material.dart';


class ResuseFormFields extends StatelessWidget {

  final TextStyle style;
  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;
  final FormFieldSetter<String> onsaved;
  final FormFieldValidator<String> validator;
  final Widget suffixIcon;
  final bool obscureText;

 ResuseFormFields({this.style,this.controller,this.hintText,this.prefixIcon,this.onsaved,this.validator,this.suffixIcon,this.obscureText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: style,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: hintText,
        prefix: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
        )  
      ),
      onSaved: onsaved,
      validator: validator,
    );
  }
}
