import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:koompi_academy_project/UI/Dashboard/createCourseScreen/CreateCourse.dart';

import 'CardViewMyCourse.dart';

class ShowPupPopMenu extends StatefulWidget {
  @override
  _ShowPupPopMenuState createState() => _ShowPupPopMenuState();
}

enum MyPupopMenu { delete, edit }

class _ShowPupPopMenuState extends State<ShowPupPopMenu> {
  MyPupopMenu _seleteion;
  //***************Alert Option Delete **************/

  displayDeleteCourse(BuildContext context) async {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 200,
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
                  Container(
                    child: Text(
                      "Do you really want to delete this item ?\nThis process cannot undone.",
                      textAlign: TextAlign.center,
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PopupMenuButton<MyPupopMenu>(
            onSelected: (MyPupopMenu result) {
              if (result == MyPupopMenu.delete) {
                setState(() {
                  _seleteion = result;
                });
                displayDeleteCourse(context);
                print(result);
              } else if (result == MyPupopMenu.edit) {
                setState(() {
                  _seleteion = result;
                });
                CardViewMyCourse();
                print(result);
                //*************** Call function edit course *************//
              }
            },
            icon: Icon(Icons.more_vert, color: Colors.grey),
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<MyPupopMenu>>[
              PopupMenuItem<MyPupopMenu>(
                value: MyPupopMenu.delete,
                child: GestureDetector(
                  onTap: () => displayDeleteCourse(context),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 25, color: Colors.grey),
                          Text("Delete")
                        ],
                      )),
                ),
              ),
              PopupMenuItem<MyPupopMenu>(
                value: MyPupopMenu.edit,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateCourse()));
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 25, color: Colors.grey),
                          Text("Edit")
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
