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

 List<Map>  listSectiontitle ;
   List<dynamic> list = List<dynamic>();

  void fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getSectionId(widget.courseId)),
      ),
    );
    if (!result.hasException) {
      listSectiontitle = List.from(result.data['sections']);
      // var practices = await jsonCodec.decode(result.data['sections']);
      // practicelist = await practices.toList();
      // parseProducts(result.data);
      // print(parseProducts(result.data['sections']));
      // print(listSectiontitle);
      // for(int i = 0 ; i< listSectiontitle.length ; i++) {
      // //   print("${listSectiontitle[i]['title']}\n");
      //   if(i >= listSectiontitle.length){
      //     list.add(listSectiontitle[i]['title']);
      //     print("List Items ======= ${list}");
      //   }
      // }
    }
  }

  // List<GetSection> parseProducts(String responseBody) { 
  //  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
  //   print(GetSection);
  //  return parsed.map<GetSection>((json) => GetSection.fromMap(json)).toList(); 

  //  }

  List<Map> _myJson = [{"id":0,"name":"<New>"},{"id":1,"name":"Test Practice"}];
  @override
  void initState() {
    fillList();
    super.initState();
  }

  var _currencies = [
    "Google Chrome Part1",
    "Google Chrome Part2",
    "Google Chrome Part3",
    "Google Chrome Part4",
    "Google Chrome Part5",
    "Google Chrome Part6",
    "Google Chrome Part7",
  ];

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
                child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              labelText: "Choose Category",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                                  child: new DropdownButton<String>(
                                  isDense: true,
                                  hint: new Text("Select"),
                                  value: _categoryName,
                                  onChanged: (String newValue) {

                                    setState(() {
                                      _categoryName = newValue;
                                    });

                                    print (_categoryName);
                                  },
                                  items: _myJson.map((Map map) {
                                    return new DropdownMenuItem<String>(
                                      value: map["id"].toString(),
                                      child: new Text(
                                        map["name"],
                                      ),
                                    );
                                  }).toList(),
                                ),
                          // child: DropdownButtonHideUnderline(
                          //   child: DropdownButton<String>(
                          //     value: _categoryName,
                          //     isDense: true,
                          //     onChanged: (String newValue) {
                          //       setState(() {
                          //         _categoryName = newValue;
                          //         state.didChange(newValue);
                          //       });
                          //     },
                          //     items: _myJson.map(( value) {
                          //       return DropdownMenuItem<String>(
                          //         value: map["id"].toString(),
                          //         child: new Text(
                          //           map["name"],
                          //         ),
                          //         // value: value,
                          //         // child: Text(
                          //         //   value,
                          //         //   style: TextStyle(fontSize: 15.0),
                          //         // ),
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),
                        );
                      },
                    )),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
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
                    SizedBox(width: 7),
                    Expanded(
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
                  ],
                ),
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
                        // color: Colors.black,
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
                                  "5f5ae3c98f0da80235fbece4",
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
