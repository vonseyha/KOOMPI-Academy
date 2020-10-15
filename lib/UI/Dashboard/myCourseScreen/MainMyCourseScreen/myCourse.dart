import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/Model/CourseModel.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';
import 'CardViewMyCourse.dart';
import 'SearchRout.dart';

class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {

TextEditingController editingSearchController = TextEditingController();
String search;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    search = editingSearchController.text ; 
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
          Container(
              height: MediaQuery.of(context).size.height / 5,
                 child:Row(
                   children: [
                     Expanded(
                       child:Image.asset('images/imgcourse.png',width: 130,height: 130),
                     ),
                     Padding(
                       padding: const EdgeInsets.only( top:40.0,right: 20),
                       child: Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Here!",style: TextStyle(fontSize: 30,fontFamily: "RobotoMono ",fontWeight: FontWeight.w400)),
                              Text("Your course.",style: TextStyle(fontSize: 20,fontFamily: "RobotoMono ",fontWeight: FontWeight.w300)),
                            ],
                         ),
                       ),
                     ),
                   ],
                 ),
            ),
          Expanded(
            child: CardViewMyCourse(),//refetchCourse: widget.refetchCourse
          ),
        ],
      ),
      floatingActionButton:FloatingActionButton(
          backgroundColor: Color(0xFF026DA2),
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context ) => SearchCourse(keySearch: search))
            );
          },
          child: Icon(Icons.search,size: 25),
        ) ,
    );
  }
}
