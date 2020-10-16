import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/mutation.dart';

class AddPoint extends StatefulWidget {
  final String courseId;

  const AddPoint({Key key, this.courseId}) : super(key: key);
  @override
  _AddPointState createState() => _AddPointState();
}

class _AddPointState extends State<AddPoint> {
  List<Map<String, dynamic>> _myJsons = [ ];
  void fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getSectionId(widget.courseId)),
      ),
    );
    if (!result.hasException) {
      print(result.data['sections'].length);
      for(int i =0; i<result.data['sections'].length ; i++){
       setState(() {
          _myJsons.add(result.data['sections'][i]);
       });
      }
    }
  }

  alertToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white);
  }

  @override
  void initState() {
    fillList();
    super.initState();
  }

  String _categoryName;
  final _pointNoController = TextEditingController();
  final _pointTitleController = TextEditingController();
  final _pointVideoLinkController = TextEditingController();

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation addMutation = QueryMutation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: new DropdownButton<String>(
                          isDense: true,
                          hint: new Text(
                            "Select the section",
                            style: TextStyle(fontSize: 15),
                          ),
                          value: _categoryName,
                          onChanged: (String newValue) {
                            setState(() {
                              _categoryName = newValue;
                            });
                            print(_categoryName);
                          },
                          items: _myJsons.map((Map map) {
                            return new DropdownMenuItem<String>(
                              value: map['id'],
                              child: new Text(
                                map['title'],
                                maxLines: 2,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(width: 7),
                      Expanded(
                        flex: 2,
                        child: Container(
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
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    flex: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: new TextFormField(
                        controller: _pointTitleController,
                        decoration: new InputDecoration(
                          labelText: "Point Title",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: new TextFormField(
                    controller: _pointVideoLinkController,
                    maxLength: 150,
                    maxLines: 2,
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
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150.0,
                      height: 40.0,
                      child: new RaisedButton(
                        color: Color(0xFF5dabff),
                        onPressed: () async {
                          if (_categoryName.isNotEmpty &&
                              _pointNoController.text.isNotEmpty &&
                              _pointTitleController.text.isNotEmpty &&
                              _pointVideoLinkController.text.isNotEmpty) {
                            GraphQLClient _client =
                                graphQLConfiguration.clientToQuery();
                            QueryResult result =
                                await _client.mutate(MutationOptions(
                              update: (Cache cache, QueryResult result) {
                                if (!result.hasException) {
                                  _pointNoController.clear();
                                  _pointTitleController.clear();
                                  _pointVideoLinkController.clear();
                                  alertToast("Add Point  Sucessfuly!");
                                } else {
                                  alertToast("Error!!!");
                                }
                                return result;
                              },
                              documentNode: gql(addMutation.createPoint(
                                  _categoryName,
                                  _pointNoController.text,
                                  _pointTitleController.text,
                                  _pointVideoLinkController.text)),
                            ));
                          } else {
                            return alertToast("Please fill form!");
                          }
                        },
                        child: new Text(
                          "Add Section",
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
