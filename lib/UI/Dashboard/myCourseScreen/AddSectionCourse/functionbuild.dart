import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/mutation.dart';
import 'addSectionPointCourse.dart';
import 'menu_drawer.dart';

//----------------------- Declare Graphql -----------------------//
GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
QueryMutation addMutation = QueryMutation();

//----------------------- Form Section -----------------------//
final _sectionNoController = TextEditingController();
final _sectionTitleController = TextEditingController();

//----------------------- Form Point  -----------------------//
final _pointNoController = TextEditingController();
final _pointTitleController = TextEditingController();
final _videoLinkController = TextEditingController();
String _section_no;
String _section_title;

String _point_no;
String _point_title;
String _video_link;

flutterToastT(String toast) {
  return Fluttertoast.showToast(
    msg: toast,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIos: 1,
    backgroundColor: Colors.blue,
    textColor: Colors.white,
  );
}

flutterToastF(String toast) {
  return Fluttertoast.showToast(
    msg: toast,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIos: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
  );
}

//----------------------- Alert Option deleteSection  -----------------------//
displayDeleteSection(BuildContext context, String section_id, Function onDeleteSection,int index) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 3,
            child: Column(
              children: [
                Container(
                    width: 60,
                    height: 60,
                    child: Image.asset("images/preview.png")),
                SizedBox(height: 10.0),
                Container(
                  child: Text("Are you sure?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 3),
                Container(
                  child: Text(
                    "Do you really want to delete this item ?\nThis process cannot undone.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new FlatButton(
                      color: Colors.grey,
                      child: Text(
                        'Concel',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 25.0),
                    new FlatButton(
                      color:  Color(0xFF4080D6),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () async {
                        GraphQLClient _client =
                            graphQLConfiguration.clientToQuery();
                        QueryResult result = await _client.mutate(
                          MutationOptions(
                            update: (Cache cache, QueryResult result) {
                              if (!result.hasException) {
                                flutterToastT(result.data['delete_section']['message']);
                                onDeleteSection(index);
                                Navigator.pop(context);
                              } else {
                                flutterToastT("Update Error!!!");
                              }
                              return result;
                            },
                            documentNode:
                                gql(addMutation.deleteSection(section_id)),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

//----------------------- Alert Option Point -----------------------//
displayDeletePoint(BuildContext context, String point_id,Function onRefetch) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 3,
            child: Column(
              children: [
                Container(
                    width: 60,
                    height: 60,
                    child: Image.asset("images/preview.png")),
                SizedBox(height: 10.0),
                Container(
                  child: Text("Are you sure?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 3),
                Container(
                  child: Text(
                    "Do you really want to delete this item ?\nThis process cannot undone.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new FlatButton(
                      color: Colors.grey,
                      child: Text(
                        'Concel',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 25.0),
                    new FlatButton(
                      color:  Color(0xFF4080D6),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () async {
                        Navigator.of(context).pop();
                        GraphQLClient _client =
                            graphQLConfiguration.clientToQuery();
                        QueryResult result = await _client.mutate(
                          MutationOptions(
                            update: (Cache cache, QueryResult result) {
                              if (!result.hasException) {
                                flutterToastT(result.data['delete_point']['message']);
                                onRefetch();
                                Navigator.pop(context);
                              } else {
                                flutterToastT("Update Error!!!");
                              }
                              return result;
                            },
                            documentNode:gql(addMutation.deletePoint(point_id)),
                          ),
                        
                        );
                        if(!result.hasException){
                          print("");
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

//----------------------- Alert Option Add Section -----------------------//
displayAddSection(BuildContext context, String section_id, String section_No,String section_Title , Function updateListView) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  _sectionNoController.text = section_No;
  _sectionTitleController.text = section_Title;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 2.7,
            width: W,
            child: Column(
              children: [
                Container(
                  child: Text("Edit ${section_Title}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500)
                        ),
                ),
                SizedBox(height: 15),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: new TextFormField(
                            controller: _sectionNoController,
                            decoration: new InputDecoration(
                              labelText: "Section No",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: new TextFormField(
                            controller: _sectionTitleController,
                            decoration: new InputDecoration(
                              labelText: "Section Title",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new FlatButton(
                      color: Colors.grey,
                      child: Text(
                        'Concel',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 25.0),
                    new FlatButton(
                      color:  Color(0xFF4080D6),
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () async {
                        if (_sectionNoController.text.isNotEmpty &&
                            _sectionTitleController.text.isNotEmpty) {
                          GraphQLClient _client =
                              graphQLConfiguration.clientToQuery();
                          QueryResult result =
                              await _client.mutate(MutationOptions(
                            update: (Cache cache, QueryResult result) {
                              if (!result.hasException) {
                                _pointNoController.clear();
                                _pointTitleController.clear();
                                 flutterToastT(result.data['update_section']['message']);
                                 updateListView();
                                Navigator.pop(context);
                                
                              } else {
                                flutterToastT("Update Error!!!");
                              }
                              return result;
                            },
                            documentNode: gql(addMutation.updateSection(
                                section_id,
                                _sectionNoController.text,
                                _sectionTitleController.text)),
                          ));
                        } else {
                          flutterToastF("Please fill form!");
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

//----------------------- Alert Option Add Point -----------------------//
displayAddPoint(BuildContext context, String point_id, String point_no, String point_title, String video_link , Function updatePoint) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  _pointNoController.text = point_no;
  _pointTitleController.text = point_title;
  _videoLinkController.text = video_link;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 2.1,
            width: W,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                       child: Container(
                          child: Text("Edit ${point_title}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w500)),
                        ),
                ), 
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: new TextFormField(
                            controller: _pointNoController,
                            decoration: new InputDecoration(
                              labelText: "Point No",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: new TextFormField(
                            controller: _pointTitleController,
                            decoration: new InputDecoration(
                              labelText: "Point Title",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: new TextFormField(
                            controller: _videoLinkController,
                            decoration: new InputDecoration(
                              labelText: "Video Link",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new FlatButton(
                      color: Colors.grey,
                      child: Text(
                        'Concel',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'sans-serif',
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 25.0),
                    new FlatButton(
                        color:  Color(0xFF4080D6),
                        child: Text(
                          'Update',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'sans-serif',
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        onPressed: () async {
                          if (_pointNoController.text.isNotEmpty &&
                              _pointTitleController.text.isNotEmpty &&
                              _videoLinkController.text.isNotEmpty) {
                            GraphQLClient _client = graphQLConfiguration.clientToQuery();
                            QueryResult result = await _client.mutate(
                              MutationOptions(
                                update: (Cache cache, QueryResult result) {
                                  if (!result.hasException) {
                                    _pointNoController.clear();
                                    _pointTitleController.clear();
                                    _videoLinkController.clear();
                                    flutterToastT(result.data['update_point']['message']);
                                    updatePoint();
                                    Navigator.pop(context);
                                  } else {
                                    flutterToastF("Update Error!!!");
                                  }
                                  return result;
                                },
                                documentNode: gql(addMutation.updatePoint(
                                  point_id,
                                  _pointNoController.text,
                                  _pointTitleController.text,
                                  _videoLinkController.text,
                                )),
                              ),
                            );
                          } else {
                            flutterToastF("Please fill form!");
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
