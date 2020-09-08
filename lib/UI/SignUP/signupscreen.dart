import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/api.dart';
import 'package:koompi_academy_project/UI/Login/loginscreen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      child: addUser(),
      client: client,
    );
  }
}

class addUser extends StatefulWidget {
  @override
  _addUserState createState() => _addUserState();
}

class _addUserState extends State<addUser> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _password;
  String _username;

  final _usernaController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  bool _isHidePassword = true;

  TextStyle style =
      TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.white);

  //*************** Login Button************//
  _buildLoginBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
        print('Register Button Pressed');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: new Text(
              "Already have account?",
              style: new TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: Colors.white,
              ), // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (context) => HomePage(
            ),
          ),
          Container(
            child: new Text(
              "\tLogin here",
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

  //*************** Button Signup************//
  _signupButton() {
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
              print(
                  "Your name: $_username and Your email: $_email and Password: $_password");
            }
            // print("Sign Up Success!");
          },
          child: Text("SIGN UP",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  //*************** Username Fill Form************//
  _usernameForm() {
    return Container(
        child: TextFormField(
      controller: _usernaController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Full Name",
          prefixIcon: Icon(Icons.child_care, color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      validator: (val) {
        if (val.length == 0)
          return "Please enter fullname";
        else if (!val.contains(""))
          return "Please enter space after last name";
        else
          return null;
      },
      onSaved: (val) => _username = val,
    ));
  }

  //*************** Email Fill Form************//
  _emailForm() {
    return Container(
        child: TextFormField(
      controller: _emailController,
      style: style,
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
      style: style,
      controller: _passController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isHidePassword ^= true;
            });
          },
          child: Icon(
            _isHidePassword ? Icons.visibility_off : Icons.visibility,
          ),
        ),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      obscureText: _isHidePassword,
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

  loginToast() {
    return Fluttertoast.showToast(
        msg: "Register Done!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Mutation(
          options: MutationOptions(
            document: CREATE_USER,
          ),
          builder: (RunMutation runMutation, QueryResult result) {
            return Container(
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
                          //******Call Widget Username Fill Form ******//
                          child: _usernameForm(),
                        )),
                        SizedBox(height: 20.0),

                        Container(
                            child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.white,
                            primaryColorDark: Colors.white70,
                          ),
                          //******Call Widget Email Fill Form ******//
                          child: _emailForm(),
                        )),

                        SizedBox(height: 20.0),
                        Container(
                            child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.white,
                            primaryColorDark: Colors.white70,
                          ),
                          //******Call Widget password Fill Form ******//
                          child: _passwordForm(),
                        )),
                        SizedBox(
                          height: 20.0,
                        ),
                        //******Call Widget Sign Up button ******//
                        GestureDetector(
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.lightBlue,
                            child: MaterialButton(
                              splashColor: Colors.white,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  runMutation({
                                    'fullname': _username,
                                    'email': _email,
                                    'password': _password,
                                  });
                                  // Navigator.pushReplacement(
                                  //     context, MaterialPageRoute(builder: (context) => Login()));
                                  loginToast();
                                  print(
                                      "Your name: $_username and Your email: $_email and Password: $_password");
                                  _usernaController.clear();
                                  _emailController.clear();
                                  _passController.clear();
                                }
                              },
                              child: Text("SIGN UP",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 100.0,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                //******Call Widget Login button ******//
                                child: _buildLoginBtn(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
