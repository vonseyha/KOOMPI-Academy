import 'package:flutter/material.dart';
import 'drawerscreen.dart';
import 'homescreen.dart';

void display() {
  runApp(HomeDisplay());
}

class HomeDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String checkAppbar;
  const HomePage({Key key, this.checkAppbar}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(), HomeScreen(checkAppbar: checkAppbar)],
      ),
    );
  }
}
