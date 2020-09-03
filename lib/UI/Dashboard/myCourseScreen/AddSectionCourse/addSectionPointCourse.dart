import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Submainpage/FregementScreen/contentFregementScreen.dart';
import 'package:koompi_academy_project/UI/Submainpage/FregementScreen/overviewFregementScreen.dart';
import 'package:tuple/tuple.dart';

import 'AddPoint.dart';
import 'AddSection.dart';

class AddSectionPointCourse extends StatefulWidget {
  @override
  _AddSectionPointCourseState createState() => _AddSectionPointCourseState();
}

class _AddSectionPointCourseState extends State<AddSectionPointCourse> with SingleTickerProviderStateMixin{

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }
    @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  

  Widget _buildDesc() {
    var datawh = MediaQuery.of(context);
    print(datawh);
    return Container(
        height: datawh.size.height,
         color: Colors.white,
        child: Column(children: <Widget>[
          Container(
          child: Column(
            children: <Widget>[
              DefaultTabController(
                length: 2, // Added
                child: Container(
                   color: Color(0xFFf7f8fc),
                   height: datawh.size.height / 13,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Expanded(
                        child: new Text(
                          'Add Section',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          'Add Point',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ],
                    unselectedLabelColor: Colors.grey[600],
                    indicatorColor: Colors.blueAccent,
                    labelColor: Colors.blueAccent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 2.0,
                    indicatorPadding: EdgeInsets.all(10),
                    isScrollable: false,
                  ),
                ),
              ), Container(
                    color:Colors.white,
                    height: MediaQuery.of(context).size.height / 2,
                    child: TabBarView(
                      controller: _tabController, 
                      children: <Widget>[
                        AddSection(),
                        AddPoint(),
                    ]),
                  ),
            ],
          )
        )
      ])
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container(
          //   alignment: Alignment.centerLeft,
          //   child:Icon(Icons.menu),
          // ),
          Expanded(
            flex: 1,
            child:Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child:Image.asset("images/coursenotfound.gif"),
                  ),
                  GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(
                      // builder: (_)=>CreateCourse()));
                      print("SHow Menu Add Section");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Icon(Icons.menu),
                    ),
                  )
                ],
              ),
              // decoration: BoxDecoration(
              //   // image: DecorationImage(
              //   //   image: AssetImage("images/coursenotfound.gif"
              //   //   )
              //   // ),
              //   color: Colors.white,
              // ),
            ),
          ),
          Expanded(
            flex: 2,
              child: _buildDesc(),
            ),
        ],
      ),
    );
    
  }
}