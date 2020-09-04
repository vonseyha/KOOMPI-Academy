import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'StatisticDashboard.dart';
import 'functionBuilt.dart';
import 'optionCard.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
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
                    color: Color(0xFF4c5881),
                  ),
                )
              ),
              GestureDetector(
                onTap: (){
                  print("Button menu click");
                },
                  child: Container(
                  padding: const EdgeInsets.only(right: 12.0),
                    child: IconButton(icon: Icon(Icons.menu)
                  ),
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
                color: Color(0xFF4c5881),
              ),
            )
          ),
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
                ),
                OptionCard(
                  image: "images/mycourse.png",
                  title: "My Courses",
                  color: 0xFFf3a11f,
                ),
                OptionCard(
                  image: "images/createcourse.png",
                  title: "Create Course",
                  color: 0xFF9e68d6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
