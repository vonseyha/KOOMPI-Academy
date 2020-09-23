import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Dashboard/createCourseScreen/CreateCourse.dart';

import 'CardViewMyCourse.dart';
import 'functionbuild.dart';

class ShowPupPopMenu extends StatefulWidget {
  final String id;
  final String org_id;
  final String title;
  final int price;
  final String pravcy;
  final String category;
  final String thumbnail;
  final String description;
  final String course_id;

  const ShowPupPopMenu({
    Key key,
    this.id,
    this.org_id,
    this.title,
    this.price,
    this.pravcy,
    this.category,
    this.thumbnail,
    this.description,
    this.course_id,
  }) : super(key: key);

  @override
  _ShowPupPopMenuState createState() => _ShowPupPopMenuState();
}

enum MyPupopMenu { delete, edit }

class _ShowPupPopMenuState extends State<ShowPupPopMenu> {
  MyPupopMenu _seleteion;

  @override
  Widget build(BuildContext context) {
    print("++++++++++++++++++++"+widget.id);
    return Center(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PopupMenuButton<MyPupopMenu>(
            onSelected: (MyPupopMenu result) {
              if (result == MyPupopMenu.delete) {
                setState(() {
                  _seleteion = result;
                });
                // displayDeleteCourse(context,);
                print(result);
              } else if (result == MyPupopMenu.edit) {
                setState(() {
                  _seleteion = result;
                });
                // CardViewMyCourse();
                print(result);
                //*************** Call function edit course *************//
              }
            },
            icon: Icon(Icons.more_vert, color: Colors.grey),
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<MyPupopMenu>>[
              PopupMenuItem<MyPupopMenu>(
                value: MyPupopMenu.delete,
                child: GestureDetector(
                  onTap: () => displayDeleteCourse(context,widget.id),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 25, color: Colors.grey),
                          Text("Delete"),
                        ],
                      )),
                ),
              ),
              PopupMenuItem<MyPupopMenu>(
                value: MyPupopMenu.edit,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateCourse()));
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 25, color: Colors.grey),
                          Text("Edit")
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
