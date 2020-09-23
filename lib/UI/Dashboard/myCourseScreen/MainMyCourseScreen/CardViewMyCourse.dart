import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/mutation.dart';
import 'package:koompi_academy_project/Model/CourseModel.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/addSectionPointCourse.dart';

import 'ShowPupPopMenu.dart';

class CardViewMyCourse extends StatefulWidget {
  @override
  _CardViewMyCourseState createState() => _CardViewMyCourseState();
}

class _CardViewMyCourseState extends State<CardViewMyCourse> {
  
  List<Course> listPerson = List<Course>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  
  void fillList() async {
    QueryMutation queryMutation = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryMutation.getAll()),
      ),
    );
    if (!result.hasException) {
      for (var i = 0; i < result.data["courses"].length; i++) {
        setState(() {
          listPerson.add(
            Course(
              result.data["courses"][i]["id"],
              result.data["courses"][i]["org_id"],
              result.data["courses"][i]["title"],
              result.data["courses"][i]["privacy"],
              result.data["courses"][i]["price"],
              result.data["courses"][i]["categories"],
              result.data["courses"][i]["thumbnail"],
              result.data["courses"][i]["description"],
              result.data["courses"][i]["owner_id"],
              result.data["courses"][i]["user"]["fullname"],
            ),
          );
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fillList();
  }

  // void _addPerson(context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       AlertDialogWindow alertDialogWindow =
  //           new AlertDialogWindow(isAdd: true);
  //       return alertDialogWindow;
  //     },
  //   ).whenComplete(() {
  //     listPerson.clear();
  //     fillList();
  //   });
  // }

  // void _editDeletePerson(context, Course person) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       AlertDialogWindow alertDialogWindow =
  //           new AlertDialogWindow(isAdd: false, person: person);
  //       return alertDialogWindow;
  //     },
  //   ).whenComplete(() {
  //     listPerson.clear();
  //     fillList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddSectionPointCourse(),
        ));
      },
      child: ListView.builder(
        itemCount: listPerson.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
            child: Card(
              elevation: 2,
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
                        image:
                            NetworkImage("${listPerson[index].getThumbnail()}"),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(10.0),
                          bottomStart: Radius.circular(10.0)),
                      color: Color(0xFFeff1f2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 10.0, left: 20),
                          child: Text(
                            "${listPerson[index].getTitle()}",
                            style: new TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        "https://avatars0.githubusercontent.com/u/41331389?s=280&v=4"),
                                  ),
                                ),
                                title: Text(
                                  "${listPerson[index].getFullname()}",
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
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ShowPupPopMenu(
                                id:listPerson[index].getId(),
                                // org_id: result.data['courses'][index]['org_id'],
                                // title: result.data['courses'][index]['title'],
                                // price: result.data['courses'][index]['price'],
                                // pravcy: result.data['courses'][index]['pravcy'],
                                // category: result.data['courses'][index]['category'],
                                // thumbnail: result.data['courses'][index]['thumbnail'],
                                // description: result.data['courses'][index]['description'],
                                // course_id: result.data['courses'][index]['course_id'],
                              ),
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
    );
  }
}

// return Column(
//                     children: [
//                       Text("${coursesList[index]['thumbnail']}"),
//                       Text("${coursesList[index]['id']}"),
//                       Text("${coursesList[index]['description']}"),
//                       Text("${coursesList[index]['title']}"),
//                       Text("${coursesList[index]['price']}"),
//                       Text("${coursesList[index]['privacy']}"),
//                       Text("[${coursesList[index]['categories']}]"),
//                       // Text(result.data['courses']['user'][index]['fullname']),
//                       Text("$index"),
//                     ],
//                   );
