import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Home/profile.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                              builder: (context) => ProfileScreen()));
                    },
                    child: CircleAvatar(backgroundImage: null)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jonh Doe',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  Text('jonhdoe22@gmail.com')
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
        ],
      ),
    );
  }
}
