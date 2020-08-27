import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koompi_academy_project/UI/Home/detailcategory.dart';
import 'package:koompi_academy_project/UI/Home/profile.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';
import 'package:koompi_academy_project/UI/Home/samplecard.dart';
import '../ContentsPage/sampleCardscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  String name;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            xOffset = 0;
            yOffset = 0;
            scaleFactor = 1;
            isDrawerOpen = false;
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isDrawerOpen
                        ? IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                scaleFactor = 1;
                                isDrawerOpen = false;
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              setState(() {
                                xOffset = 230;
                                yOffset = 170;
                                scaleFactor = 0.6;
                                isDrawerOpen = true;
                              });
                            }),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image(
                            image:
                                AssetImage('images/koompi_academy_black.png'),
                            width: 150.0,
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/koompi_icon.png'),
                        backgroundColor: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: isDrawerOpen
                          ? Text(
                              'Search.....',
                              textAlign: TextAlign.center,
                            )
                          : TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search.....',
                              ),
                            ),
                    ),
                    Icon(Icons.keyboard_voice)
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailCard(name: categories[index]['name']),
                              ));
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: shadowList,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SvgPicture.asset(
                                categories[index]['iconPath'],
                                width: 100,
                                height: 40,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                categories[index]['name'],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.585,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SampleGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
