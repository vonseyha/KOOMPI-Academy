import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'functionbuild.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';

class EndDrawer extends StatefulWidget {
  final String courseId;
  const EndDrawer({Key key, this.courseId}) : super(key: key);

  @override
  _EndDrawerState createState() => _EndDrawerState();
}

enum MyPupopMenu { delete, edit }

class _EndDrawerState extends State<EndDrawer> {
  //----------------------- Show item select option-----------------------//
  Widget _simplePopup(String sectionID, String section_No, String section_Title,
          Function onDeleteSection, int index, Function updateListView) =>
      PopupMenuButton<MyPupopMenu>(
        onSelected: (MyPupopMenu result) {
          if (result == MyPupopMenu.delete) {
            Navigator.push(
              context,
              //  MaterialPageRoute(builder: (_) => displayDeleteSection(context, sectionID)),
              displayDeleteSection(context, sectionID, onDeleteSection, index),
            );
          } else if (result == MyPupopMenu.edit) {
            Navigator.push(
              context,
              displayAddSection(context, sectionID, section_No, section_Title,
                   updateListView),
            );
          }
        },
        icon: Icon(Icons.more_horiz, color: Colors.grey, size: 20),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: MyPupopMenu.delete,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Icon(Icons.delete, size: 25, color: Colors.grey),
            ),
          ),
          PopupMenuItem(
            value: MyPupopMenu.edit,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Icon(Icons.edit, size: 25, color: Colors.grey),
            ),
          ),
        ],
      );


  void onDeleteSection(int index) {
    setState(() {
      getSection.removeAt(index);
    });
  }

  
  void onDeletePoint(List deletePoint, int index1) {
    setState(() {
      deletePoint.removeAt(index1);
    });
  }

  void updateListView() {
    getSection.clear();
    fillList();
  }

 bool loadingSections = true;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  List getSection = List();
  void fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getSections(widget.courseId)),
      ),
    );
    if (!result.hasException) {
        for (int i = 0; i < result.data['sections'].length; i++) {
          setState(() {
            getSection.add(result.data['sections'][i]);
          });
            loadingSections = true;
        }
         loadingSections = false;
    }
  }

  @override
  void initState() {
    fillList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Expanded(
        child: loadingSections == true
          ? Center(child: Image.asset("images/gif.gif",width: 100,))
          :  ListView.builder(
          itemCount: getSection.length,
          itemBuilder: (BuildContext context, int index) {
            print(getSection.length);
             print(index);
            return Expanded(
              child: Column(
                children: [
                   ExpansionTile(
                    leading: _simplePopup(
                      getSection[index]["id"],
                      getSection[index]["no"],
                      getSection[index]["title"],
                      onDeleteSection,
                      index,
                      updateListView,
                    ),
                    title: Text( " ${getSection[index]["no"]}.\t${getSection[index]["title"]}",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    children: <Widget>[
                      if (getSection[index].containsKey("points"))
                        for (int a = 0 ; a <  getSection[index]["points"].length ; a++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                      " ${getSection[index]["points"][a]["no"]}.\t${getSection[index]["points"][a]["title"]}",
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 14)),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      child: IconButton(
                                        onPressed: () {
                                          displayAddPoint(
                                            context,
                                            getSection[index]["points"][a]["id"],
                                            getSection[index]["points"][a]["no"],
                                            getSection[index]["points"][a]["title"],
                                            getSection[index]["points"][a]  ["video_link"],
                                            updateListView,
                                          );
                                        },
                                        icon: Icon(Icons.edit,
                                            size: 15, color: Colors.grey),
                                      ),
                                    ),
                                    Container(
                                      width: 15.0,
                                      child: IconButton(
                                        onPressed: () {
                                          displayDeletePoint(
                                              context,
                                              getSection[index]["points"][a]["id"],
                                              updateListView,
                                            );
                                        },
                                        icon: Icon(Icons.delete,
                                            size: 15, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
