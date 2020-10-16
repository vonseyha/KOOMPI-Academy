import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/mutation.dart';
import 'package:koompi_academy_project/Model/CourseModel.dart';
import 'myCourse.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
QueryMutation addMutation = QueryMutation();
List<Course> listPerson = List<Course>();
//***************Alert Option Delete **************/

displayDeleteCourse(BuildContext context, String id , Function refechData,int index) async {//Function refetchCourse
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  print(id);
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                Container(
                    width: 70,
                    height: 70,
                    child: Image.asset("images/preview.png")),
                SizedBox(height: 10.0),
                Container(
                  child: Text("Are you sure?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 3),
                Container(
                  child: Text(
                    "Do you really want to delete this item ?\nThis process cannot undone.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new FlatButton(
                      color: Colors.grey,
                      child: Text(
                        'Concel',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 25.0),
                    new FlatButton(
                      color: Colors.blue,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () async {
                        GraphQLClient _client = graphQLConfiguration.clientToQuery();
                        QueryResult result = await _client.mutate(
                          MutationOptions (
                            documentNode: gql(addMutation.deleteCourse(id)),
                          ),
                        );
                        if (!result.hasException) {
                          loginToast("Delete Sucessfuly!");
                           Navigator.pop(context);
                          refechData(index);
                          // listPerson.clear();
                        } else {
                          loginToast("Delete Course Not Found!");
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

loginToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white);
}
