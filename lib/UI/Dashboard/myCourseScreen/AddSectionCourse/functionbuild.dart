import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//----------------------- Alert Option delete -----------------------//

displayDeleteCourse(BuildContext context) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 3.5,
            child: Column(
              children: [
                Container(
                    width: 60,
                    height: 60,
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
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
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
                        Navigator.of(context).pop();
                        return Fluttertoast.showToast(
                            msg: "Delete Sucessfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white);
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

//----------------------- Alert Option Add Section -----------------------//
displayAddSection(BuildContext context) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  String Default = "Edit";
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 2.6,
            width: W,
            child: Column(
              children: [
                Container(
                    width: 70,
                    height: 70,
                    child: Image.asset("images/edit.png")),
                SizedBox(height: 5.0),
                Container(
                  child: Text("Edit Google Chrome Part 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 10.0),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: new TextFormField(
                            // controller: _productName,
                            decoration: new InputDecoration(
                              labelText: "Section No",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: new TextFormField(
                            // controller: _productName,
                            decoration: new InputDecoration(
                              labelText: "Section Title",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                      color: Color(0xFF29b6d6),
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        return Fluttertoast.showToast(
                            msg: "Update Sucessfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white);
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

//----------------------- Alert Option Add Point -----------------------//
displayAddPoint(BuildContext context) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  String Default = "Edit";
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 2.1,
            width: W,
            child: Column(
              children: [
                Container(
                    width: 70,
                    height: 70,
                    child: Image.asset("images/edit.png")),
                SizedBox(height: 5.0),
                Container(
                  child: Text("Edit Google Chrome Part 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 10.0),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: new TextFormField(
                            // controller: _productName,
                            decoration: new InputDecoration(
                              labelText: "Section No",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: new TextFormField(
                            // controller: _productName,
                            decoration: new InputDecoration(
                              labelText: "Section Title",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: new TextFormField(
                            // controller: _productName,
                            decoration: new InputDecoration(
                              labelText: "Video Link",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                      color: Color(0xFF29b6d6),
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        return Fluttertoast.showToast(
                            msg: "Update Sucessfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white);
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
