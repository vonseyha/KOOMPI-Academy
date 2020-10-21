import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

  //*************** Remember check box************//
bool get rememberMe => _isRembemerMe;
bool _isRembemerMe = false;

  Widget remberMeCheckBox(BuildContext context ) {
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
  }