import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:koompi_academy_project/UI/Dashboard/maindashboardScreen/dashboardScreen.dart';
import 'package:koompi_academy_project/UI/Home/homedisplay.dart';
import 'package:koompi_academy_project/UI/SignUP/signupscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.white);
  String _email;
  String _password;
  String _resetemail;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _passwordVisible = true;
  //*************** Login Connect to back-end************//

  String alertText;
  String msg;

  Future<String> login(String email, String password, context) async {
    String token;
    String role;
    var response =
        await http.post("https://learnbackend.koompi.com/login", body: {
      'email': email,
      'password': password,
    });
    print(response.statusCode);
    print(email.toString() + password.toString());
    if (response.statusCode == 200) {
      SharedPreferences isToken = await SharedPreferences.getInstance();
      var responseJson = json.decode(response.body);
      token = responseJson['token'];
      print(responseJson);
      if (token != null) {
        isToken.setString('token', token);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainDashboard()));
        msg = "Login Successful";
        loginToast(msg); 
        _emailController.clear();
        _passController.clear();  
      } else {
        try {
          alertText = responseJson['error']['message'];
        } catch (e) {
          alertText = responseJson['message'];
        }
      }
    } else {
      final data = jsonDecode(response.body);
      msg = data['message'];
      loginToastFail(msg);
    }
    return alertText;
  }

  loginToastFail(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  loginToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }

  //*************** Forgot Password Connect to back-end************//
  Future<String> forgotpassword(String email) async {
    var response = await http
        .post("https://learnbackend.koompi.com/forgot-password", body: {
        'email': email,
    });
    print(response.statusCode);
    print(email.toString());
  }

  //*************** Sign Up Button************//
  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Signup()));
        print('Register Button Pressed');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: new Text(
              "Don't have ann account?",
              style: new TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: new Text(
              "\tSign Up",
              style: new TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
  //*************** Forgot  Password Button************//
  _forgotPass() {
    return GestureDetector(
      onTap: () {
        _displayDialog();
        print("You are forgot password");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: new Text(
              "Forgot Password?",
              style: new TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  //*************** Display Dailog Forgot Password Button************//
  _displayDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            content: Container(
              height: 80.0,
              width: 310.0,
              child: Column(
                children: <Widget>[
                  Container(
                      child: new Text(
                    "FORGOT PASSWORD",
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'sans-serif',
                      color: Colors.indigo,
                    ),
                  )),
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        contentPadding: EdgeInsets.all(15.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val.length == 0)
                          return "Please enter email";
                        else if (!val.contains("@"))
                          return "Please enter valid email";
                        else
                          return null;
                      },
                      onSaved: (val) => _resetemail = val,
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  'Cancel',
                  style: new TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                    fontFamily: 'sans-serif',
                  ),
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text(
                  'Submit',
                  style: new TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                    fontFamily: 'sans-serif',
                  ),
                ),
                color: Colors.amber,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    forgotpassword(_resetemail);
                    print(_resetemail);
                  }
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  //*************** Login Button************//
  _loginButon() {
    return GestureDetector(
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.lightBlue,
        child: MaterialButton(
          splashColor: Colors.white,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              login(_email, _password, context);
              // print("Your email: $_email and Password: $_password");
            }
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => HomeDisplay()));
          },
          child: Text("LOGIN",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  //*************** Email Fill Form************//
  _emailForm() {
    return Container(
        child: TextFormField(
      style: style,
      controller: _emailController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          prefixIcon: Icon(Icons.alternate_email, color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      keyboardType: TextInputType.emailAddress,
      validator: (val) {
        if (val.length == 0)
          return "Please enter email";
        else if (!val.contains("@"))
          return "Please enter valid email";
        else
          return null;
      },
      onSaved: (val) => _email = val,
    ));
  }

  //*************** Password Fill Form************//
  _passwordForm() {
    return Container(
      child: TextFormField(
      obscureText: _passwordVisible,
      controller: _passController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: Icon(Icons.lock, color: Colors.white70),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _passwordVisible ^= true;
              });
            },
            child: Icon(
              _passwordVisible ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      keyboardType: TextInputType.emailAddress,
      validator: (val) {
        if (val.length == 0)
          return "Please enter password";
        else if (val.length <= 5)
          return "Your password should be more then 6 char long";
        else
          return null;
      },
      onSaved: (val) => _password = val,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: Container(
            padding: EdgeInsets.only(top: 40.0),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 110.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Image.asset(
                          "images/koompi_logos.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Container(
                        child: new Theme(
                      data: new ThemeData(
                        primaryColor: Colors.white,
                        primaryColorDark: Colors.white70,
                      ),
                      //******Call Widget Email Full Form ******//
                      child: _emailForm(),
                    )),
                    SizedBox(height: 35.0),
                    Container(
                        child: new Theme(
                      data: new ThemeData(
                        primaryColor: Colors.white,
                        primaryColorDark: Colors.white70,
                      ),
                      //******Call Widget Password Full Form ******//
                      child: _passwordForm(),
                    )),
                    SizedBox(
                      height: 35.0,
                    ),
                    //******Call Widget Login Button ******//
                    _loginButon(),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 130.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  //******Call Widget Sign up  Button ******//
                                  child: _buildSignupBtn(),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            //******Call Widget Forgot Password FButton******//
                            child: _forgotPass(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
