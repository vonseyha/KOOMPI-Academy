import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'functionbuild.dart';

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

    //----------------------- Show item select option-----------------------//
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
                                      displayAddPoint(context);
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
