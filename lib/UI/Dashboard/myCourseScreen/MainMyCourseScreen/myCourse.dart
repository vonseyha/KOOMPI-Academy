import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';
import 'package:koompi_academy_project/UI/Submainpage/CommentPage/commentScreen.dart';

import 'ShowPupPopMenu.dart';

class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}
class _MyCourseState extends State<MyCourse> {

  //***************Card View Course***************/
 Widget _buildCardView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Color(0xFFc3c4c5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image(
                        width: MediaQuery.of(context).size.width,
                        height: 170.0,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://learnbackend.koompi.com/uploads/a.png"
                          ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(10.0),
                          bottomStart: Radius.circular(10.0)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.white,
                          Colors.white54,
                          Color(0xFFeff1f2),
                        ]
                      )                     
                    ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Google Chrome",
                              style: new TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Serif',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child:ListTile(
                          leading:CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage("https://avatars0.githubusercontent.com/u/41331389?s=280&v=4"),
                                ),
                            ),
                            title: Text(
                              "Tang Eamseng",
                              style: new TextStyle(
                                fontFamily: 'sans-serif',
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                              ),
                            ),
                            subtitle: Text('1K views | 1 month ago',
                                style: new TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFF4d6890),
                                )
                            ),
                          ),
                              ),
                              Expanded(
                                flex: 1,
                                child: showPupPopMenu(),
                              )
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      child: Image.asset("images/backone.png"),
                    ),
                  ),
                  Container(
                    child: Text("Back"),
                  )
                ],
              ),
            ),
          ),
          Text(
            "Here Your Course!",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: shadowList,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    hintText: 'Search course',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCardView(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
