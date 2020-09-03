import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/addSectionPointCourse.dart';

import 'ShowPupPopMenu.dart';

class CardViewMyCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddSectionPointCourse(),
            ));
          },
          child: ListView.builder(
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
                                  child: ShowPupPopMenu(),
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
      ),
    ),
    );
  }
}