import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Dashboard/maindashboardScreen/dashboardScreen.dart';
import 'UI/Home/homedisplay.dart';
import 'UI/Home/homedisplay.dart';
import 'UI/Home/samplecard.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomeDisplay(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xFFf7f8fc),
      child: MainDashboard(),
    ));
  }
}
