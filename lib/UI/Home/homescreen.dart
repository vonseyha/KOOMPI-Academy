import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koompi_academy_project/UI/Home/detailcategory.dart';
import 'package:koompi_academy_project/UI/Home/profile.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';
import 'package:koompi_academy_project/UI/Home/samplecard.dart';
import 'package:koompi_academy_project/UI/Home/subCategory.dart';
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
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
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
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        xOffset = 250;
                        yOffset = 170;
                        scaleFactor = 0.6;
                        isDrawerOpen = true;
                      });
                    }),
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
                      ? IconButton(
                          icon: Icon(
                            Icons.search,
                          ),
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              isSearchClick = true;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.close,
                          ),
                          color: Colors.black,
                          onPressed: () {
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SubCagateory(
                                        name: categories[index]['name']),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'All Videos here',
                            style: TextStyle(color: Colors.red, fontSize: 17),
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
                          child: ListView.builder(
                            /////////////////////////////////////////////////////
                            // scrollDirection: Axis.horizontal, /// problem here
                            /////////////////////////////////////////////////////

                            ///here to change number of context///
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Color(0xFFc3c4c5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          child: Image(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 210.0,
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://learnbackend.koompi.com/uploads/a.png"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional.only(
                                                    bottomEnd:
                                                        Radius.circular(10.0),
                                                    bottomStart:
                                                        Radius.circular(10.0)),
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: <Color>[
                                                  Colors.white,
                                                  Colors.white70,
                                                  Color(0xFFeff1f2),
                                                ])),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text(
                                                "Google Chrome",
                                                style: new TextStyle(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontFamily: 'Serif',
                                                ),
                                              ),
                                            ),
                                            ListTile(
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
                                                "Tang Eamseng",
                                                style: new TextStyle(
                                                  fontFamily: 'sans-serif',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              subtitle: Text(
                                                  '1K views | 1 month ago',
                                                  style: new TextStyle(
                                                    fontSize: 12.0,
                                                    color: Color(0xFF4d6890),
                                                  )),
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
