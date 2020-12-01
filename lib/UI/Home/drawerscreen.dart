import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Home/bottom_sheet_shape.dart';
import 'package:koompi_academy_project/UI/Home/profiledrawer.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';
import 'package:koompi_academy_project/UI/SplashScreen/IsLoginShPre.dart';
import 'package:koompi_academy_project/UI/SplashScreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  void initState() {
    super.initState();
    SharePrefer.isLogin().then((value) => {
          if (value != null)
            {
              jwtDecode(value),
            }
        });
  }

  String id;
  String fullname;
  String email;
  String role;
  bool isNothing;

  Future<String> jwtDecode(String token) {
    if (token == null) return null;
    final parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }
    final payload = parts[1];
    var normalized = base64Url.normalize(payload);
    var resp = utf8.decode(base64Url.decode(normalized));
    final payloadMap = json.decode(resp);
    if (payloadMap is! Map<String, dynamic>) {
      return null;
    }
    setState(() {
      id = payloadMap['id'];
      fullname = payloadMap['fullname'];
      email = payloadMap['email'];
      role = payloadMap['role'];
      isNothing = false;
    });
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('seen');
    prefs.remove('token');
    prefs.remove('role');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.only(top: 70, bottom: 50, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileD()));
                      },
                      child: CircleAvatar(backgroundImage: null)),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isNothing
                        ? Text(
                            fullname,
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'fullname',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                    isNothing ? Text(email) : Text('email')
                  ],
                )
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Image(
            //       image: AssetImage('images/koompi_academy_black.png'),
            //       width: 230.0,
            //       height: 45.0,
            //     ),
            //   ],
            // ),
            Column(
              children: drawerItems
                  .map((element) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              element['icon'],
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(element['title'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))
                          ],
                        ),
                      ))
                  .toList(),
            ),
            Container(
              child: GestureDetector(
                onTap: () => _openSignOutDrawer(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Log out',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openSignOutDrawer(BuildContext context) {
    showModalBottomSheet(
        shape: BottomSheetShape(),
        backgroundColor: Colors.black54,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 16,
              left: 48,
              right: 48,
            ),
            height: 180,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "$fullname, are you sure you want to sign out?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()));
                        },
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Text(
                          "Sign out",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        borderSide: BorderSide(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Stay logged in",
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
