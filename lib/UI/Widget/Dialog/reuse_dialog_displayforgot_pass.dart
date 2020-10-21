import 'package:flutter/material.dart';

  //*************** Display Dailog Forgot Password Button************//
 displayDialogForgotPass(BuildContext context,String _resetemail,Function onPress) async {
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
                onPressed: onPress,
              )
            ],
          );
        });
  }