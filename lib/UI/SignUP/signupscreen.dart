import 'package:flutter/material.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/api.dart';
import 'package:koompi_academy_project/UI/Login/loginscreen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/UI/Widget/Form/reuse_materialButton.dart';
import 'package:koompi_academy_project/UI/Widget/Form/reuse_signBtn.dart';
import 'package:koompi_academy_project/UI/Widget/Form/reuse_textform.dart';
import 'package:koompi_academy_project/UI/Widget/Form/reuse_textform_fill.dart';
import 'package:koompi_academy_project/UI/Widget/Form/reuse_toastMs.dart';

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

  @override
  Widget build(BuildContext context) {
    print(client);
    return Scaffold(
      body: Mutation(
          options: MutationOptions(
            document: CREATE_USER,
            update: (Cache cache, QueryResult result) {
              if (!result.hasException) {
                ReuseToastMessage.toastMessage( "Register Sucessfuly.", Color(0xFF4080D6), Colors.white);
                _usernaController.clear();
                _emailController.clear();
                _passController.clear();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              } else {
                ReuseToastMessage.toastMessage(
                    "Error: Email is already in use.",
                    Colors.red,
                    Colors.white);
              }
              return result;
            },
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
                          height: 25.0,
                        ),
                        Container(
                            child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.white,
                            primaryColorDark: Colors.white70,
                          ),
                          //******Call Widget Username Fill Form ******//
                          child: ResuseFormFieldEmail(
                            style: style,
                            controller: _usernaController,
                            hintText: 'Full Name',
                            prefixIcon:
                                Icon(Icons.child_care, color: Colors.white70),
                            validator: (val) {
                              if (val.length == 0)
                                return "Please enter fullname";
                              else if (!val.contains(""))
                                return "Please enter space after last name";
                              else
                                return null;
                            },
                            onsaved: (val) => _username = val,
                          ),
                        )),
                        SizedBox(height: 10.0),
                        Container(
                            child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.white,
                            primaryColorDark: Colors.white70,
                          ),
                          //******Call Widget Email Fill Form ******//
                          child: ResuseFormFieldEmail(
                            style: style,
                            controller: _emailController,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.alternate_email,
                                color: Colors.white70),
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
                          //******Call Widget password Fill Form ******//
                          child: ResuseFormFields(
                            obscureText: _isHidePassword,
                            controller: _passController,
                            style: style,
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock, color: Colors.white70),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isHidePassword ^= true;
                                });
                              },
                              child: Icon(
                                _isHidePassword
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
                          height: 15.0,
                        ),
                        //******Call Widget Sign Up button ******//
                        ReuseMeterialButton(
                          evaluation: 0.0,
                          color: Color(0xFF4080D6),
                          child: MaterialButton(
                            splashColor: null,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                runMutation({
                                  'fullname': _username,
                                  'email': _email,
                                  'password': _password,
                                });
                              }
                            },
                            child: Text("SIGN UP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 70.0,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  //******Call Widget Login button ******//
                                  child: SignupBtn.buildSignupBtn(
                                      "Already have account?", 'Login here',
                                      () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              })),
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
