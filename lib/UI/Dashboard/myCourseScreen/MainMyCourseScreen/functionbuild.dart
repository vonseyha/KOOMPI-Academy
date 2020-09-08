import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//***************Alert Option Delete **************/

displayDeleteCourse(BuildContext context) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height / 3.5,
            child: Column(
              children: [
                Container(
                    width: 70,
                    height: 70,
                    child: Image.asset("images/preview.png")),
                SizedBox(height: 10.0),
                Container(
                  child: Text("Are you sure?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 3),
                Container(
                  child: Text(
                    "Do you really want to delete this item ?\nThis process cannot undone.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new FlatButton(
                      color: Colors.grey,
                      child: Text(
                        'Concel',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 25.0),
                    new FlatButton(
                      color: Colors.blue,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () {
                        loginToast("Delete Sucessfuly!");
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

loginToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white);
}
