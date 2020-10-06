import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/Model/CourseModel.dart';
import 'package:koompi_academy_project/UI/Home/profile.dart';
import '../../../constants.dart';
import 'StatisticDashboard.dart';
import 'functionBuilt.dart';
import 'optionCard.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {

  void printOut(){
    print("Hello world");
  }

  List<Course> listPerson = List<Course>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  
  void fillList() async {
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
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarDesign(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 28),
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Statistic",
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Sans-serif",
                        fontWeight: FontWeight.w600,
                        // color: Color(0xFF4c5881),
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    print("Button menu click");
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ));
                        },
                        icon: Icon(Icons.person_outline)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                children: [
                  InfoCard(
                    title: "Active",
                    iconColor: kPrimaryColorActive,
                    effectedNum: 1062,
                  ),
                  InfoCard(
                    title: "Idle",
                    iconColor: kPrimaryColorIdle,
                    effectedNum: 1062,
                  ),
                  InfoCard(
                    title: "Feedback",
                    iconColor: kPrimaryColorFeedback,
                    effectedNum: 1062,
                  ),
                  InfoCard(
                    title: "Unmerged",
                    iconColor: kPrimaryColorUnmerged,
                    effectedNum: 1062,
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: new Text(
                  "OPTION",
                  style: new TextStyle(
                    fontSize: 25.0,
                    fontFamily: "Sans-serif",
                    fontWeight: FontWeight.w600,
                    // color: Color(0xFF4c5881),
                  ),
                )),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OptionCard(
                    image: "images/viewcourse.png",
                    title: "View Courses",
                    color: 0xFF2db697,
                    // refetchCourse: (){},
                  ),
                  OptionCard(
                    image: "images/mycourse.png",
                    title: "My Courses",
                    color: 0xFFf3a11f,
                    // refetchCourse: fillList,
                  ),
                  OptionCard(
                    image: "images/createcourse.png",
                    title: "Create Course",
                    color: 0xFF9e68d6,
                    // refetchCourse: fillList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
