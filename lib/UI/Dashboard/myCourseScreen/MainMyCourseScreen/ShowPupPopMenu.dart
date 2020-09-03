import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Dashboard/createCourseScreen/CreateCourse.dart';

class showPupPopMenu extends StatefulWidget {
  @override
  _showPupPopMenuState createState() => _showPupPopMenuState();
}

enum MyPupopMenu { delete, edit }

class _showPupPopMenuState extends State<showPupPopMenu> {
  MyPupopMenu _seleteion;
  //***************Alert Option Delete **************/
  _displayDialog() async {
    var height = MediaQuery.of(context);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            content: Container(
              height: height.size.height / 7,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Container(
                        alignment: Alignment.center,
                        child: new Text(
                          "Are you sure?",
                          style: new TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sans-serif',
                            color: Colors.indigo,
                          ),
                        )),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new FlatButton(
                            color: Colors.amber[600],
                            child: Text(
                              'YES',
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
                            },
                          ),
                          SizedBox(width: 25.0),
                          new FlatButton(
                            color: Colors.blue,
                            child: Text(
                              'NO',
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
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  callCreateCourse() async{
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateCourse()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
                  child: PopupMenuButton<MyPupopMenu>(
            onSelected: (MyPupopMenu result) {
              if (result == MyPupopMenu.delete){
                setState(() {
                  _seleteion = result;
                });
                _displayDialog();
                print(result);
              } else if (result == MyPupopMenu.edit) {
                setState(() {
                  _seleteion = result;
                });
                print(result);
                //*************** Call function edit course *************//
              }
            },
            icon: Icon(Icons.more_vert, color: Colors.grey),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<MyPupopMenu>>[
              PopupMenuItem<MyPupopMenu>(
                value: MyPupopMenu.delete,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete, size: 25, color: Colors.amber[500]),
                    ],
                  ),
                ),
              ),
              PopupMenuItem<MyPupopMenu>(
                value: MyPupopMenu.edit,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.edit, size: 25, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
