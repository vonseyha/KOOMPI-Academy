import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koompi_academy_project/UI/Home/homedisplay.dart';
import 'package:koompi_academy_project/UI/SplashScreen/splashscreen.dart';
import 'UI/Login/loginscreen.dart';
import 'UI/Splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App());
  });
}

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
    ));
  }
}
