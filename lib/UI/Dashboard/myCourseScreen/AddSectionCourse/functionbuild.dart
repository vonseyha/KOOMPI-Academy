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

//----------------------- Alert Option deleteSection  -----------------------//
displayDeleteSection(BuildContext context , String section_id) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  print(section_id);
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 3.5,
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
                      color: Colors.blue,
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
                      onPressed: () async{
                        GraphQLClient _client =
                            graphQLConfiguration.clientToQuery();
                        QueryResult result = await _client.mutate(
                          MutationOptions(
                            documentNode: gql(addMutation.deleteSection(section_id)),
                          ),
                        );
                         if (!result.hasException) {
                          //  refecthdata();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddSectionPointCourse()));
                         return Fluttertoast.showToast(
                            msg: "Delete Sucessfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white);
                        }else {
                              Navigator.of(context).pop();
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

//----------------------- Alert Option Point -----------------------//
displayDeletePoint(BuildContext context,String point_id) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 3.5,
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
                      color: Colors.blue,
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
                      onPressed: () async{
                        Navigator.of(context).pop();
                        GraphQLClient _client =
                            graphQLConfiguration.clientToQuery();
                        QueryResult result = await _client.mutate(
                          MutationOptions(
                            documentNode: gql(addMutation.deletePoint(point_id)),
                          ),
                        );
                         if (!result.hasException) {
                          Navigator.of(context).pop();
                         return Fluttertoast.showToast(
                            msg: "Delete Sucessfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white);
                        }else {
                              Navigator.of(context).pop();
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
displayAddSection(BuildContext context , String section_id) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  print(section_id);
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 2.6,
            width: W,
            child: Column(
              children: [
                Container(
                    width: 70,
                    height: 70,
                    child: Image.asset("images/edit.png")),
                SizedBox(height: 5.0),
                Container(
                  child: Text("Edit Google Chrome Part 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 10.0),
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
                              //fillColor: Colors.green
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
                      color: Color(0xFF29b6d6),
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
                      onPressed: () async{
                            if(_sectionNoController.text.isNotEmpty && _sectionTitleController.text.isNotEmpty){
                              GraphQLClient _client = graphQLConfiguration.clientToQuery();
                              QueryResult result = await _client.mutate(
                                MutationOptions(
                                 documentNode: gql(addMutation.updateSection(section_id,_sectionNoController.text, _sectionTitleController.text)), 
                                )
                              );
                              if(!result.hasException){
                                _pointNoController.clear();
                                _pointTitleController.clear();
                                // refecthdata();
                               Navigator.push(context, MaterialPageRoute(builder: (context) => AddSectionPointCourse()));
                                return Fluttertoast.showToast(
                                        msg: "Update Section  Sucessfuly!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIos: 1,
                                        backgroundColor: Colors.blue,
                                        textColor: Colors.white,
                                  );
                              }else {
                                print("Update Error!!!");
                              }
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
displayAddPoint(BuildContext context, String point_id) async {
  var H = MediaQuery.of(context).size.height;
  var W = MediaQuery.of(context).size.width;
  // String Default = "Edit";
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: H / 2.1,
            width: W,
            child: Column(
              children: [
                Container(
                    width: 70,
                    height: 70,
                    child: Image.asset("images/edit.png")),
                SizedBox(height: 5.0),
                Container(
                  child: Text("Edit Google Chrome Part 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 10.0),
                Expanded(
                  flex: 2,
                  child: Container(
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
                              //fillColor: Colors.green
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
                              //fillColor: Colors.green
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
                              //fillColor: Colors.green
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
                      color: Color(0xFF29b6d6),
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
                      onPressed: () async{
                          if(_pointNoController.text.isNotEmpty && _pointTitleController.text.isNotEmpty && _videoLinkController.text.isNotEmpty){
                            GraphQLClient _client = graphQLConfiguration.clientToQuery();
                            QueryResult result = await _client.mutate(
                              MutationOptions(
                                documentNode: gql(addMutation.updatePoint( 
                                  point_id, 
                                  _pointNoController.text,
                                  _pointTitleController.text, 
                                  _videoLinkController.text
                                  )
                                ),
                              ),
                            );
                            if(!result.hasException){
                              _pointNoController.clear();
                              _pointTitleController.clear();
                              _videoLinkController.clear();
                              Navigator.of(context).pop();
                                    return Fluttertoast.showToast(
                                        msg: "Update Course  Sucessfuly!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIos: 1,
                                        backgroundColor: Colors.blue,
                                        textColor: Colors.white);
                            }else {
                                print("Error Update!!!");
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
                        Navigator.of(context).pop();
                        }
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });

}
