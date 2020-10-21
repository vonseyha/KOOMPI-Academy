import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/Model/CourseModel.dart';
import 'package:koompi_academy_project/Model/SectionModel.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/MainMyCourseScreen/functionbuild.dart';
import 'package:koompi_academy_project/UI/Submainpage/CommentPage/commentScreen.dart';
import 'functionbuild.dart';

class EndDrawer extends StatefulWidget {
  final String courseId;
  const EndDrawer({Key key, this.courseId}) : super(key: key);

  @override
  _EndDrawerState createState() => _EndDrawerState();
}

enum MyPupopMenu { delete, edit }
class _EndDrawerState extends State<EndDrawer> {

  //----------------------- Show item select option-----------------------//
  Widget _simplePopup(String sectionID, String section_No , String section_Title ,Function onDeleteSection,int index,List updateListView) => PopupMenuButton<MyPupopMenu>(
        onSelected: (MyPupopMenu result){
            if(result == MyPupopMenu.delete){
                Navigator.push(
                  context,
                  //  MaterialPageRoute(builder: (_) => displayDeleteSection(context, sectionID)),
                  displayDeleteSection(context, sectionID,onDeleteSection,index),
                );
            }else if (result == MyPupopMenu.edit){
                Navigator.push(
                  context,
                     displayAddSection(context, sectionID,section_No,section_Title,index,updateListView),
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
            value:  MyPupopMenu.edit,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Icon(Icons.edit, size: 25, color: Colors.grey),
              ),
            ),
        ],
      );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: 'http://192.168.1.145:6001/private/api'),
    ),
  );

  QueryGraphQL queryGraphQL = QueryGraphQL();
  // List<Section> listSection = List<Section>();
  List deleteSection;
  List deletePoint;

  void  onDeleteSection(int index){
    setState(() {
      deleteSection.removeAt(index);
    });
  }
  
  void  onDeletePoint(int index){
    setState(() {
      deletePoint.removeAt(index);
    });
  }

  void updateListView(int index){
    setState(() {
      listPerson;
    });
  }

  //  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   setState(() {
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GraphQLProvider(
        client: client,
        child: Scaffold(
            body: Query(
          options: QueryOptions(
            documentNode: gql(queryGraphQL.getSections(widget.courseId,)),
          ),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.loading) {
              return Center(
                 child: SpinKitFadingCircle  (color: Colors.blueGrey, size: 50),
              );
            }
            List repositories = result.data['sections'];
            deleteSection = repositories;
            return ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ExpansionTile(
                        leading: _simplePopup(
                        repositories[index]["id"],
                        repositories[index]["no"],
                        repositories[index]["title"],
                        onDeleteSection,
                        index,
                        repositories,
                      ),
                        title: Text(" ${repositories[index]["no"]}.\t${repositories[index]["title"]}",
                          maxLines: 2,
                          textAlign: TextAlign.center, 
                          style: TextStyle(fontSize: 14),
                        ),
                        children: <Widget>[
                          if (result.data['sections'][index].containsKey("points"))
                            for (var a = 0; a <result.data['sections'][index]["points"].length;a++)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                horizontal: 25.0),
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(" ${repositories[index]["points"][a]["no"]}.\t${repositories[index]["points"][a]["title"]}",
                                          maxLines: 3,
                                          style: TextStyle(fontSize: 14
                                         )
                                        ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          child: IconButton(
                                            onPressed: () {
                                              displayAddPoint(
                                                  context,
                                                  repositories[index]["points"][a]["id"],
                                                  repositories[index]["points"][a]["no"],
                                                  repositories[index]["points"][a]["title"],
                                                  repositories[index]["points"][a]["video_link"],
                                                  );
                                            },
                                            icon: Icon(Icons.edit,size: 15, color: Colors.grey),
                                          ),
                                        ),
                                        Container(
                                          width: 15.0,
                                          child: IconButton(
                                            onPressed: () {
                                              print("delete section");
                                              setState(() {
                                                deletePoint = repositories[index]['points'];
                                              });
                                              displayDeletePoint(
                                                  context,
                                                  repositories[index]["points"][a]["id"],
                                                  onDeletePoint,
                                                  a
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
                  );
              },
            );
          },
        )),
      ),
    );
  }
}
