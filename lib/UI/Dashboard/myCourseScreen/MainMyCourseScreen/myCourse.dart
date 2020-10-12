import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/Model/CourseModel.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';
import 'CardViewMyCourse.dart';

class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {

TextEditingController editingSearchController = TextEditingController();

List<Course> listPerson = List<Course>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  
 Future <String> fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getAll()),
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
              result.data["courses"][i]["views"],
            ),
          );
        });
      }
    }
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
                child: TextField(
                    controller: editingSearchController,
                    // focusNode: focusNode,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color(0x4437474F),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "Search here...",
                      contentPadding: const EdgeInsets.only(
                        left: 16,
                        right: 20,
                        top: 14,
                        bottom: 14,
                      ),
                    ),
                  ),
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
        ],
      ),
      floatingActionButton:FloatingActionButton(
          backgroundColor: Color(0xFF19B8C9),
          foregroundColor: Colors.white,
          onPressed: () {
            // Respond to button press
          },
          child: Icon(Icons.search,size: 25),
        ) ,
    );
  }
}
