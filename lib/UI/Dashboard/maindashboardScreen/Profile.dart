import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Home/bottom_sheet_shape.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextStyle _style() {
    return TextStyle(fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Stack(
            children: <Widget>[
              Container(),
              ClipPath(
                clipper: _AppBarClipper(),
                child: Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.black),
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
                        "Neecoder X",
                        style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Developer",
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
                      onPressed: () {},
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
          child: Column(
            children: <Widget>[
              Text("Name"),
              SizedBox(
                height: 4,
              ),
              Text(
                "Milan Short",
                style: _style(),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Email",
                style: _style(),
              ),
              SizedBox(
                height: 4,
              ),
              Text("milan@gmail.com"),
              SizedBox(
                height: 16,
              ),
              Text(
                "Location",
                style: _style(),
              ),
              SizedBox(
                height: 4,
              ),
              Text("New York, USA"),
              SizedBox(
                height: 16,
              ),
              Text(
                "Language",
                style: _style(),
              ),
              SizedBox(
                height: 4,
              ),
              Text("English, French"),
              SizedBox(
                height: 16,
              ),
              Text(
                "Occupation",
                style: _style(),
              ),
              SizedBox(
                height: 4,
              ),
              Text("Employee"),
              Container(
                  width: 130,
                  height: 40,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.black87,
                    onPressed: () {
                      _openSignOutDrawer(context);
                    },
                    child: Text("Sign Out", style: TextStyle(fontSize: 15)),
                    // icon: Icon(, size: 18),
                  )),
            ],
          ),
        ),
      ],
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
                          print("Logouted");
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
