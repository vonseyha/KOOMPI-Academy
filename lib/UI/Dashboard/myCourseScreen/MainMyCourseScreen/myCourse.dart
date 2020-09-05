import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/addSectionPointCourse.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';
import 'package:koompi_academy_project/UI/Submainpage/CommentPage/commentScreen.dart';

import 'CardViewMyCourse.dart';
import 'ShowPupPopMenu.dart';

class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}
class _MyCourseState extends State<MyCourse> {
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardViewMyCourse(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
