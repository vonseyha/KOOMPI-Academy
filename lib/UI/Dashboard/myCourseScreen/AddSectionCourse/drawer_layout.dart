import 'package:flutter/material.dart';

import 'drawer_item.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class DrawerLayout extends StatefulWidget {
  @override
  _DrawerLayoutState createState() => _DrawerLayoutState();
}

class _DrawerLayoutState extends State<DrawerLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
              print("click");
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Container(),
      endDrawer: ClipPath(
          clipper: _DrawerClipper(),
          // child: MultiLevelDrawer(

          // )
        ),
    );
  }
}

class _DrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(50, 0);
    path.quadraticBezierTo(0, size.height / 2, 50, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}