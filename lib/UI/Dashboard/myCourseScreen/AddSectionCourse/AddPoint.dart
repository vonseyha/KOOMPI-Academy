import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/mutation.dart';
import 'package:koompi_academy_project/Model/GetSectionIdModel.dart';
import 'functionbuild.dart';

class AddPoint extends StatefulWidget {
  final String courseId;

  const AddPoint({Key key, this.courseId}) : super(key: key);

  @override
  _AddPointState createState() => _AddPointState();
}

class _AddPointState extends State<AddPoint> {
  List<GetSection> listGetSection = List<GetSection>();
  List<Map<String, dynamic>> lists;
  void fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getSectionId(widget.courseId)),
      ),
    );
    if (!result.hasException) {
      setState(() {
         lists = List.from(result.data['sections']);
         print('$result');
      });
     
    }
  }

  List<Map<String, dynamic>> _myJson = [
      {
        "id": "5f5ae3c98f0da80235fbece4",
        "title": "លីមីតនៃអនុគមន៍"
      },
      {
        "id": "5f5ae4828f0da80235fbece5",
        "title": "ភាពជាប់នៃអនុគមន៍"
      },
      {
        "id": "5f5ae4ca8f0da80235fbece6",
        "title": "លីមីតនៃស៊ី្វត"
      },
      {
        "id": "5f7583600cac583303213496",
        "title": "ចំណងជើងមេរៀន"
      }
  ];
  
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
                    Container(
                     width: MediaQuery.of(context).size.width /2.5,
                    child: new DropdownButton<String>(
                      isDense: true,
                      hint: new Text("Select the section",style: TextStyle(fontSize: 15),),
                      value: _categoryName,
                      onChanged: (String newValue) {
                        setState(() {
                          _categoryName = newValue;
                        });
                        print(_categoryName);
                      },
                      items: _myJson.map((Map map) {
                        return new DropdownMenuItem<String>(
                          value: map["id"].toString(),
                          child: new Text(
                            map["title"],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width:7),
                      Expanded(
                      flex: 2,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1,
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
                  )
                ),

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
                    )
              ),
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
                              documentNode: gql(addMutation.createPoint(
                                  _categoryName,
                                  _pointNoController.text,
                                  _pointTitleController.text,
                                  _pointVideoLinkController.text)),
                            ));
                            if (!result.hasException) {
                              _pointNoController.clear();
                              _pointTitleController.clear();
                              _pointVideoLinkController.clear();
                              Navigator.of(context).pop();
                              return Fluttertoast.showToast(
                                  msg: "Add Point  Sucessfuly!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIos: 1,
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white);
                            } else {
                              print("Add Failed");
                            }
                          } else {
                            return Fluttertoast.showToast(
                                msg: "Please fill form!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white);
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
