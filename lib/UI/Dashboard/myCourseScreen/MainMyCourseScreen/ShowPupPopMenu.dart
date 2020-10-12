import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/api.dart';
import 'package:koompi_academy_project/UI/Dashboard/createCourseScreen/UpdateCourse.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';
import 'functionbuild.dart';

class ShowPupPopMenu extends StatefulWidget {
  final String id;
  final String org_id;
  final String title;
  final int price;
  final int index;
  final String privacy;
  final List category;
  final Future<File> thumbnail;
  final String description;
  final Function refetchCourse;
  final Function onDeleteClick;
  final tage_mode;

  const ShowPupPopMenu(
      {Key key,
      this.id,
      this.org_id,
      this.title,
      this.price,
      this.privacy,
      this.category,
      this.thumbnail,
      this.description,
      this.refetchCourse,
      this.tage_mode,
      this.onDeleteClick,
      this.index})
      : super(key: key);

  @override
  _ShowPupPopMenuState createState() => _ShowPupPopMenuState();
}

enum MyPupopMenu { delete, edit }

class _ShowPupPopMenuState extends State<ShowPupPopMenu> {
  MyPupopMenu _seleteion;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<MyPupopMenu>(
        onSelected: (MyPupopMenu result) {
          if (result == MyPupopMenu.delete) {
           // widget.onDeleteClick(widget.id, widget.index);
            print('delete');
            displayDeleteCourse(context, widget.id,widget.onDeleteClick,widget.index);
          } else if (result == MyPupopMenu.edit) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UpdateCourse(
                          id: widget.id,
                          org_id: widget.org_id,
                          title: widget.title,
                          price: widget.price,
                          pravcy: widget.privacy,
                          category: widget.category,
                          thumbnail: widget.thumbnail,
                          description: widget.description,
                        )
                      )
                  );
          }
        },
        icon: Icon(Icons.more_vert, color: Colors.grey),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<MyPupopMenu>>[
          PopupMenuItem<MyPupopMenu>(
            value: MyPupopMenu.delete,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.delete, size: 25, color: Colors.grey),
                ],
              ),
            ),
          ),
          PopupMenuItem<MyPupopMenu>(
            value: MyPupopMenu.edit,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit, size: 25, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
