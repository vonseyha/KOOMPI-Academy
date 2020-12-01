import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:koompi_academy_project/UI/SplashScreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login/JwtDecode.dart';
import 'Login/loginscreen.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<String> _isSeen() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString('seen');
  }

  Future<String> _isToken() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString('token');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      _isSeen().then((value) {
        if (value == "true") {
          _isToken().then((value) {
            if (value != null) {
              JwtDecode.tryParseJwt(value, context);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            }
          });
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SplashScreen()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/logo_koompi_black.png", height: 160),
          SizedBox(height: 15.0),
          SpinKitCircle(color: Colors.black, size: 30),
        ],
      ),
    );
  }
}
