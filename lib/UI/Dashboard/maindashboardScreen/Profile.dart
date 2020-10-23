import 'dart:convert';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Home/bottom_sheet_shape.dart';
import 'package:koompi_academy_project/UI/SplashScreen/IsLoginShPre.dart';
import 'package:koompi_academy_project/UI/SplashScreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 
  TextStyle _style() {
    return TextStyle(fontWeight: FontWeight.bold);
  }
  

  @override
  void initState() {
    super.initState();
    SharePrefer.isLogin().then((value) =>{
      if(value != null){
        jwtDecode(value),
      }
    });
  }

  String id;
  String fullname;
  String email;
  String role;

 Future<String> jwtDecode(String token){
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
        });
  }

  Future<void > signOut() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('seen');
    prefs.remove('token');
    prefs.remove('role');
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: <Widget>[
                  Container(),
                  ClipPath(
                    clipper: _AppBarClipper(),
                    child: Container(
                      height: 250.0,
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Align(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircularProfileAvatar(
                            "https://cedat.mak.ac.ug/wp-content/uploads/2019/08/blank-profile-male.png",
                            borderWidth: 4.0,
                            radius: 50.0,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            fullname,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            role,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Container(
                            child: Center(
                                child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                        Text("User Profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            child: Center(
                                child: Icon(
                              Icons.settings,
                              color: Colors.white,
                            )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fullname:", style: TextStyle(fontSize: 15)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(fullname,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    )),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email:", style: TextStyle(fontSize: 15)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(email,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    )),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Course:", style: TextStyle(fontSize: 15)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("120",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
                      child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(width: 2.0, color: Colors.black87),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              height: 40.0,
                              width: 40.0,
                              child: Image.asset("images/mycourse.png",
                                  color: Colors.black87)),
                        ),
                        Text(
                          "Help&Support",
                          style: Theme.of(context).textTheme.body2.copyWith(
                                color: Color(0xFF3f597f),
                                fontSize: 13.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width:15),
                //----------------------------
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(width: 2.0, color: Colors.black87),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              height: 40.0,
                              width: 40.0,
                              child: Image.asset("images/mycourse.png",
                                  color: Colors.black87)),
                        ),
                        Text(
                          "Privacy",
                          style: Theme.of(context).textTheme.body2.copyWith(
                                color: Color(0xFF3f597f),
                                fontSize: 13.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                //----------------------------
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                  onPressed: () {
                    _openSignOutDrawer(context);
                  },
                  child: Text("Sign Out", style: TextStyle(color: Colors.white)),
                  color: Colors.black,
                  splashColor: Colors.black54),
            ),
          ],
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
                  "Laura, are you sure you want to sign out?",
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen()));
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

class _AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height - 80;
    Path path = Path();

    path.moveTo(0, height - 40);
    path.quadraticBezierTo(size.width / 2, height, size.width, height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
