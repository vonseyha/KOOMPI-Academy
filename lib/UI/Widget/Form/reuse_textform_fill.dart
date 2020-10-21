import 'package:flutter/material.dart';


class ResuseFormFieldEmail extends StatelessWidget {

  final TextStyle style;
  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;
  final FormFieldSetter<String> onsaved;
  final FormFieldValidator<String> validator;

 ResuseFormFieldEmail({this.style,this.controller,this.hintText,this.prefixIcon,this.onsaved,this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: hintText,
        prefix: prefixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
        )  
      ),
      onSaved: onsaved,
      validator: validator,
    );
  }
}
