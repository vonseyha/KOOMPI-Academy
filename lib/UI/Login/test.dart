import 'package:flutter/material.dart';
import 'reuse_textform.dart';
import 'test2.dart';
import 'reuse_button.dart';

class Test extends StatelessWidget {
  String _email;
  String _pass;
  final _formKey = GlobalKey<FormFieldState>();

  void validate() {
    _formKey.currentState.save();
    print(_email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            // color: Colors.red,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Test flutter"),
                  FlutterLogo(),
                  //_emailForm(),
                  ReuseTextField(
                    labelText: 'Email',
                    onSaved: (newValue) => _email = newValue,
                    mValidator: (validate) =>
                        validate.isEmpty ? "Please enter email" : null,
                  ),
                  ReuseFormFill(
                    hintText: "password",
                    prefixIcon:
                        Icon(Icons.alternate_email, color: Colors.white70),
                    onsaved: (newValue) => _pass = newValue,
                  ),
                  ReuseButton.item(
                      'Log IN', () => print('Log in'), Colors.lightBlue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
