import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';
import 'package:koompi_academy_project/UI/Home/samplecard.dart';
import 'package:koompi_academy_project/UI/Home/subCategory.dart';

import 'DisplayCourseByCategory.dart';

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
  bool isSearchClick = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
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
        child: Scaffold(
          appBar: AppBar(
            ///for expend the appbar///
            // toolbarHeight: 80,
            leading: isDrawerOpen
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      });
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        xOffset = 250;
                        yOffset = 170;
                        scaleFactor = 0.6;
                        isDrawerOpen = true;
                      });
                    },
                    child: Icon(Icons.menu, color: Colors.black)),
            title: Image(
              image: AssetImage('images/koompi_academy_black.png'),
              width: 170,
              height: 60,
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 1,
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: isSearchClick == false
                      ? GestureDetector(
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              isSearchClick = true;
                            });
                          },
                        )
                      : GestureDetector(
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              isSearchClick = false;
                            });
                          },
                        ))
            ],
            bottom: isSearchClick == true
                ? PreferredSize(
                    preferredSize: Size(50, 60),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: isDrawerOpen == true
                            ? Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                    boxShadow: shadowList,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white),
                                child: Text(
                                  'Find Somethings...',
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    boxShadow: shadowList,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      hintText: 'Find Somethings...'),
                                ),
                              ),
                      ),
                    ),
                  )
                : null,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: InkWell(
                            onTap: () {
                              if( categories[index]['name'] == "sala"){
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SubCagateory(
                                        name: categories[index]['name']),
                                  ));
                              }else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DisplayCourseByCategories(
                                        name: categories[index]['name']),
                                  ));
                              }
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
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ALL VIDEOS HERE  ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          ///
                          ///all video here///
                          ///
                          child: SampleGrid(),
                          // child: VideoDisplay(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
