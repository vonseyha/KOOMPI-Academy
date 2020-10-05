import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'functionbuild.dart';

class EndDrawer extends StatefulWidget {
  final String courseId;
  const EndDrawer({Key key, this.courseId}) : super(key: key);

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
              onTap: () => displayDeleteSection(context, sectionID),
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Icon(Icons.delete, size: 25, color: Colors.grey),
              ),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: GestureDetector(
              onTap: () => displayAddSection(context, sectionID),
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Icon(Icons.edit, size: 25, color: Colors.grey),
              ),
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GraphQLProvider(
        client: client,
        child: Scaffold(
            body: Query(
          options: QueryOptions(
            documentNode: gql(queryGraphQL.getSections(widget.courseId)),
          ),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.loading) {
              return Text('Loading');
            }
            List repositories = result.data['sections'];
            return ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ExpansionTile(
                        leading: _simplePopup(repositories[index]["id"]),
                        title: Text(
                          " ${repositories[index]["no"]}.\t${repositories[index]["title"]}",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                        children: <Widget>[
                          if (result.data['sections'][index]
                              .containsKey("points"))
                            for (var a = 0; a <result.data['sections'][index]["points"].length;
                                a++)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        " ${repositories[index]["points"][a]["no"]}.\t${repositories[index]["points"][a]["title"]}",
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 14)),
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          child: IconButton(
                                            onPressed: () {
                                              displayAddPoint(
                                                  context,
                                                  repositories[index]["points"][a]["id"]);
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
                                              displayDeletePoint(
                                                  context,
                                                  repositories[index]["points"][a]["id"]);
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
