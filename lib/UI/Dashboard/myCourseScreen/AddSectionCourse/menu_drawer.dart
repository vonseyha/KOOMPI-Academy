import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/MainMyCourseScreen/ShowPupPopMenu.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _currencies = [
      "Google Chrome",
    ];
    String _categoryName;

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
                            // Navigator.pushReplacement(
                            //     context,
                            // MaterialPageRoute(
                            //     builder: (context) => CreateCourse()));
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MyCourse()));
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
                            // displayUpdateCourse(context);
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MyCourse()));
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

    displayAddSection(BuildContext context) async {
      var H = MediaQuery.of(context).size.height;
      var W = MediaQuery.of(context).size.width;
      String Default = "Edit";
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                height: H / 3,
                width: W,
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     // Container-------
                    //   ],
                    // ),
                    // SizedBox(height: 15.0),
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
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(),
                                  ),
                                  //fillColor: Colors.green
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: new TextFormField(
                                // controller: _productName,
                                decoration: new InputDecoration(
                                  labelText: "Section Title",
                                  fillColor: Colors.white,
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
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
                    Container(
                      height: 30.0,
                      child: Container(
                        child: new RaisedButton(
                          color: Color(0xFF5dabff),
                          onPressed: () {
                            print("Button Pressed");
                            Navigator.pop(context);
                          },
                          child: new Text(
                            "Update",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    Widget _simplePopup() => PopupMenuButton<int>(
          icon: Icon(Icons.more_horiz, color: Colors.grey, size: 20),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: GestureDetector(
                onTap: () => displayDeleteCourse(context),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Icon(Icons.delete, size: 25, color: Colors.grey),
                ),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: GestureDetector(
                onTap: () => displayAddSection(context),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Icon(Icons.edit, size: 25, color: Colors.grey),
                ),
              ),
            ),
          ],
        );

    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: _simplePopup(),
                    ),
                    title: Text(
                      "Title One",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1. children One ",
                                maxLines: 2, style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                      displayDeleteCourse(context);
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("2. children Two",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("3. children Three",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("4. children Four",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("5. children Five",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          icon: Icon(Icons.more_horiz, size: 20),
                          onPressed: () {
                            print("edit or delete");
                          }),
                    ),
                    title: Text(
                      "Title Two",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1. children One ",
                                maxLines: 2, style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("2. children Two",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("3. children Three",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("4. children Four",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("5. children Five",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          icon: Icon(Icons.more_horiz, size: 20),
                          onPressed: () {
                            print("edit or delete");
                          }),
                    ),
                    title: Text(
                      "Title Three",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1. children One ",
                                maxLines: 2, style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("2. children Two",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("3. children Three",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("4. children Four",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("5. children Five",
                                style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      print('');
                                    },
                                    icon: Icon(Icons.delete,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
