import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/Model/SectionModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'functionbuild.dart';

class EndDrawer extends StatefulWidget {
  final String courseId;
  const EndDrawer({
    Key key,
    this.courseId
  }):super(key:key);

  @override
  _EndDrawerState createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {

   //----------------------- Show item select option-----------------------//
    Widget _simplePopup(String sectionID) => PopupMenuButton<int>(
          icon: Icon(Icons.more_horiz, color: Colors.grey, size: 20),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: GestureDetector(
                onTap: () => displayDeleteSection(context,sectionID),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Icon(Icons.delete, size: 25, color: Colors.grey),
                ),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: GestureDetector(
                onTap: () => displayAddSection(context,sectionID),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Icon(Icons.edit, size: 25, color: Colors.grey),
                ),
              ),
            ),
          ],
        );

    List<Section> listSection = List<Section>();
    // final List advisoryservices = (result.data['advisory_service']) as List<dynamic>;
    GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
    void sectionList() async{
      QueryGraphQL queryGraphQL = QueryGraphQL();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getSections(widget.courseId) ),
      ),
    );
    
     if(!result.hasException){
        String section_id; 
        String course_id;
        String section_no;
        String section_title;
        String section_message;
        
        String points_id;
        String points_no;
        String points_title;
        String videoLink;
        bool    preview;
        String sections_id;
        String message;

        for( int i = 0 ; i <   (result.data['sections']).length ; i++){
           print( "Title    ${result.data['sections'][i]['title']}");
          section_id             = result.data["sections"][i]["id"];
          course_id             = result.data["sections"][i]["course_id"];
          section_no             = result.data["sections"][i]["no"];
          section_title           = result.data["sections"][i]["title"];
          section_message   = result.data["sections"][i]["message"];
          if( result.data['sections'][i].containsKey("points")){
            for(var a = 0 ; a < result.data['sections'][i]["points"].length ; a++){
                   print("Subtitle   ${result.data['sections'][i]["points"][a]["title"]}");
                  points_id           =  result.data["sections"][i]["points"][a]["id"];
                  points_no          = result.data["sections"][i]["points"][a]["no"];
                  points_title         = result.data["sections"][i]["points"][a]["title"];
                  videoLink           = result.data["sections"][i]["points"][a]["videoLink"];
                  preview             = result.data["sections"][i]["points"][a]["preview"];
                  sections_id        = result.data["sections"][i]["points"][a]["section_id"];
                  message           =  result.data["sections"][i]["points"][a]["message"];

            }
          }
        }

        List data = [
                section_id   ,          
                course_id        ,     
                section_no     ,       
                section_title    ,      
                section_message  ,
                points_id  ,
                points_no ,
                points_title,
                videoLink  ,
                preview    ,
                sections_id,
                message ,
        ];
        print(data);
         setState(() {
            listSection.add(
              Section(
                section_id   ,          
                course_id        ,     
                section_no     ,       
                section_title    ,      
                section_message  ,
                points_id  ,
                points_no ,
                points_title,
                videoLink  ,
                preview    ,
                sections_id,
                message ,
              )
            );
            print(listSection.length);
            print(listSection.toList());
            // print("${ result.data["sections"][i]["points"][0]["id"] }");
            // print("${title}");
          });
      }
    }

    @override
  void initState() {
    super.initState();
    sectionList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: listSection.length,
        itemBuilder: (BuildContext context,int index) {
          return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: _simplePopup(listSection[index].getSectionId()),
                    ),
                    title: Text(
                      " ${listSection[index].getSectionNo()}.\t${listSection[index].getSectionTitle()}",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " ${listSection[index].getPointNo()}.\t${listSection[index].getPointTitle()}",
                                maxLines: 2, style: TextStyle(fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      displayAddPoint(context,  listSection[index].getPointId());
                                      print('edit');
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 15, color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                      // print('');
                                      displayDeletePoint(context, listSection[index].getPointId());
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
              )
            );
        }),
      );
  }
}