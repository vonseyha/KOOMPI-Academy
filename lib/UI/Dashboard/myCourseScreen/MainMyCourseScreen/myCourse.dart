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
          SizedBox(height: 5),
          Container(
             child: Row(
               children: [
                 Expanded(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Here!",style: TextStyle(fontSize: 30)),
                        Text("Your Course.",style: TextStyle(fontSize: 25)),
                      ],
                    ),
                 ),
                 Expanded(
                    child: SvgPicture.asset('images/teacher.svg',width: 100,height: 100),
                 ),
               ],
             ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardViewMyCourse(),//refetchCourse: widget.refetchCourse
              ),
            ),
          ),
          // if(editingSearchController.text != null)
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
