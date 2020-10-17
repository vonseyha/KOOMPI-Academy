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
  final String owner_id;
  final String  fullname;
  MainDashboard({Key key,this.owner_id,this.fullname}) : super(key: key);
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarDesign(widget.fullname),
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
                    effectedNum: 11,
                  ),
                  InfoCard(
                    title: "Idle",
                    iconColor: kPrimaryColorIdle,
                    effectedNum: 93,
                  ),
                  InfoCard(
                    title: "Feedback",
                    iconColor: kPrimaryColorFeedback,
                    effectedNum: 112,
                  ),
                  InfoCard(
                    title: "Unmerged",
                    iconColor: kPrimaryColorUnmerged,
                    effectedNum: 93,
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
                    owner_id: null,
                    // refetchCourse: (){},
                  ),
                  OptionCard(
                    image: "images/mycourse.png",
                    title: "My Courses",
                    color: 0xFFf3a11f,
                    owner_id: "5d52486a1adfbd764bd951f8",
                    // refetchCourse: fillList,
                  ),
                  OptionCard(
                    image: "images/createcourse.png",
                    title: "Create Course",
                    color: 0xFF9e68d6,
                    owner_id: widget.owner_id,
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
