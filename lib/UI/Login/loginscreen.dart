import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:koompi_academy_project/UI/SignUP/signupscreen.dart';
import 'package:http/http.dart' as http;
import 'package:koompi_academy_project/UI/Widget/Dialog/reuse_dialog_displayforgot_pass.dart';
import 'package:koompi_academy_project/UI/Widget/Form/reuse_materialButton.dart';
import 'package:koompi_academy_project/UI/Widget/Form/reuse_signBtn.dart';
import 'package:koompi_academy_project/UI/Widget/Form/reuse_textform.dart';
import 'package:koompi_academy_project/UI/Widget/Form/reuse_textform_fill.dart';
import 'package:koompi_academy_project/UI/Widget/Form/reuse_toastMs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'JwtDecode.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

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
    var response =
        await http.post("https://learnbackend.koompi.com/login", body: {
      //http://192.168.1.145:6001/login
      'email': email,
      'password': password,
    });
    print(response.statusCode);
    print(email.toString() + password.toString());
    if (response.statusCode == 200) {
      SharedPreferences isToken = await SharedPreferences.getInstance();
      var responseJson = json.decode(response.body);
      token = responseJson['token'];
      isToken.setString('saved_email', email);
      if (token != null) {
        isToken.setString('token', token); //Set Key to checkUser
        JwtDecode.tryParseJwt(token, context);
        msg = "Login Successful";
        ReuseToastMessage.toastMessage(msg, Color(0xFF4080D6), Colors.white);
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
      ReuseToastMessage.toastMessage(msg, Colors.red, Colors.white);
    }
    return alertText;
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

  //*************** Forgot  Password Button************//
  _forgotPass() {
    return GestureDetector(
      onTap: () {
        displayDialogForgotPass(
            context,
            _resetemail,
            () => () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    forgotpassword(_resetemail);
                    print(_resetemail);
                  }
                  Navigator.of(context).pop();
                });
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

  //*************** Remember check box************//
  bool get rememberMe => _isRembemerMe;
  bool _isRembemerMe = false;

  Widget remberMeCheckBox() {
    return CheckboxListTile(
      checkColor: Theme.of(context).primaryColor,
      activeColor: Colors.white,
      value: _isRembemerMe,
      onChanged: handleRememberMe,
      title: Text(
        "Remember me",
        style: TextStyle(color: Colors.black54),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  void handleRememberMe(bool value) {
    print("Handle Rember Me");
    _isRembemerMe = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
      },
    );
    setState(() {});
  }

  void _loadUserEmail() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _email = _prefs.getString("saved_email") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      if (_remeberMe) {
        _emailController.text = _email ?? "";
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: 20.0,
                  ),
                  Container(
                      child: new Theme(
                    data: new ThemeData(
                      primaryColor: Colors.white,
                      primaryColorDark: Colors.white70,
                    ),
                    //******Call Widget Email Full Form ******//
                    child: ResuseFormFieldEmail(
                      style: style,
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon:
                          Icon(Icons.alternate_email, color: Colors.white70),
                      validator: (val) {
                        if (val.length == 0)
                          return "Please enter email";
                        else if (!val.contains("@"))
                          return "Please enter valid email";
                        else
                          return null;
                      },
                      onsaved: (val) => _email = val,
                    ),
                  )),
                  SizedBox(height: 10.0),
                  Container(
                      child: new Theme(
                    data: new ThemeData(
                      primaryColor: Colors.white,
                      primaryColorDark: Colors.white70,
                    ),
                    //******Call Widget Password Full Form ******//
                    child: ResuseFormFields(
                      obscureText: _passwordVisible,
                      controller: _passController,
                      style: style,
                      hintText: "Password",
                      prefixIcon:
                          Icon(Icons.lock_outline, color: Colors.white70),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible ^= true;
                          });
                        },
                        child: Icon(
                          _passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (val) {
                        if (val.length == 0)
                          return "Please enter password";
                        else if (val.length <= 5)
                          return "Your password should be more then 6 char long";
                        else
                          return null;
                      },
                      onsaved: (val) => _password = val,
                    ),
                  )),
                  SizedBox(
                    height: 5.0,
                  ),
                  remberMeCheckBox(),
                  SizedBox(
                    height: 05.0,
                  ),
                  //******Call Widget Login Button ******//
                  ReuseMeterialButton(
                    evaluation: 0.5,
                    color: Color(0xFF4080D6),
                    child: MaterialButton(
                      splashColor: null,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          login(_email, _password, context);
                        }
                      },
                      child: Text("LOGIN",
                          textAlign: TextAlign.center,
                          style: style.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 90.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                //******Call Widget Sign up  Button ******//
                                child: SignupBtn.buildSignupBtn(
                                    "Don't have an account?", "Sign Up", () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signup()));
                                }),
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
    );
  }
}
