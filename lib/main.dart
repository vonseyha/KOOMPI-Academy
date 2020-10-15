import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Dashboard/maindashboardScreen/dashboardScreen.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/AddPoint.dart';
import 'package:koompi_academy_project/UI/Home/samplecard.dart';
import 'package:koompi_academy_project/UI/SplashScreen/splashscreen.dart';
import 'UI/Dashboard/myCourseScreen/AddSectionCourse/addSectionPointCourse.dart';
import 'UI/Dashboard/myCourseScreen/MainMyCourseScreen/CardViewMyCourse.dart';
import 'UI/Dashboard/myCourseScreen/MainMyCourseScreen/myCourse.dart';
import 'UI/Home/homedisplay.dart';
import 'UI/Home/homedisplay.dart';
import 'UI/Home/profile.dart';
import 'UI/Login/loginscreen.dart';
import 'UI/Splash.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomeScreen(),
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
        child: HomeDisplay(),
      )
    );
  }
}
