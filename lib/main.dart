import 'package:flutter/material.dart';
import 'UI/Home/homedisplay.dart';
import 'UI/Login/loginscreen.dart';
import 'UI/SignUP/signupscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
