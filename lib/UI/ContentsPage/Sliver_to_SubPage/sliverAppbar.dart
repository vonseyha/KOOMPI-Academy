
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/drawer_layout.dart';

class PortfolioSliverAppBar extends StatelessWidget {
  final String _title;

  const PortfolioSliverAppBar(
    this._title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.blueAccent,
      expandedHeight: 280,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          _title,
          style: TextStyle(color: Colors.black,fontSize: 15),
        ),
        background: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset("images/coursenotfound.gif"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                            builder: (_)=>DrawerLayout()));
                            print("SHow Menu Add Section");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Icon(Icons.menu, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ]  
              ),
          )
        ),    
    );
  }
}