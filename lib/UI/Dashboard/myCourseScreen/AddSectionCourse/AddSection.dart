import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/mutation.dart';
class AddSection extends StatefulWidget {
  final String courseId;
  final String courseTitle;
  const AddSection({
    Key key,
    this.courseId,
    this.courseTitle
  }):super(key:key);

  @override
  _AddSectionState createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {

// String a
//   var _currencies = [
//     widget.courseTitle,
//   ];


  String _categoryName;
  final _sectionTitleController = TextEditingController();
  final _sectionNoController = TextEditingController();
  final _courseTitleController = TextEditingController();

  @override
  void initState() {
    _courseTitleController.text = widget.courseTitle;
    super.initState();
  }


  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation addMutation = QueryMutation();

  @override
  Widget build(BuildContext context) {
    // print(widget.courseTitle);
    // setState(() {
    //   _courseTitleController.text = widget.courseTitle;
    // });
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
                          child: new TextFormField(
                            controller: _courseTitleController,
                            enabled: false,
                            decoration: new InputDecoration(
                              labelText: "Section Title",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                            onChanged: (value) => value = widget.courseTitle,
                          ),
                        ),
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
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1,
                        child: new TextFormField(
                          controller: _sectionTitleController,
                          // maxLength: 50,
                          decoration: new InputDecoration(
                            labelText: "Section Title",
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
              // SizedBox(height: 20),
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
                            if(_sectionNoController.text.isNotEmpty&&_sectionTitleController.text.isNotEmpty){
                              GraphQLClient _client = graphQLConfiguration.clientToQuery();
                              QueryResult result = await _client.mutate(
                                  MutationOptions(
                                    documentNode: gql(addMutation.createSection(
                                        widget.courseId,
                                        _sectionNoController.text,
                                        _sectionTitleController.text,
                                    )
                                  ),
                                )
                              );
                               if (!result.hasException) {
                                       _sectionNoController.clear();
                                       _sectionTitleController.clear();
                                      // Navigator.of(context).pop();
                                      return Fluttertoast.showToast(
                                          msg: "Add Section  Sucessfuly!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIos: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white);
                                    } 
                            }else {
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
