import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/addSectionPointCourse.dart';

import 'ShowPupPopMenu.dart';

class SearchCourse extends StatefulWidget {
  final String keySearch;
  SearchCourse({Key key, this.keySearch}) : super(key: key);

  @override
  _SearchCourseState createState() => _SearchCourseState();
}

class _SearchCourseState extends State<SearchCourse> {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: 'http://192.168.1.145:6001/private/api'),
    ),
  );
TextEditingController editingSearchController = TextEditingController();

QueryGraphQL queryGraphQL = QueryGraphQL();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
        children: [
          Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 50,
                      child: TextField(
                              controller: editingSearchController,
                              // focusNode: focusNode,
                              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0x4437474F),
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                ),
                                suffixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                                hintText: "Search here...",
                                contentPadding: const EdgeInsets.only(
                                  left: 16,
                                  right: 20,
                                  top: 14,
                                  bottom: 14,
                                ),
                              ),
                              onChanged: (value) {  
                                setState(() {
                                  value = editingSearchController.text;
                                });
                              }            
                            ),
                    ),
                  ),
          Expanded(
                    child: GraphQLProvider(
              client: client,
              child:  Query(
                    options: QueryOptions(
                      documentNode: gql(queryGraphQL.searchCourse(editingSearchController.text)), 
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
                    List repositories = result.data['courses_by_search'];
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: repositories.length,
                            itemBuilder: (BuildContext context, int index) {
                               return GestureDetector(
                          onTap: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddSectionPointCourse(
                                  // course_id: listPerson[index].getId(),
                                  // course_title: listPerson[index].getTitle()
                                  ),
                            ));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color(0xFFc3c4c5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Image(
                                        width: MediaQuery.of(context).size.width,
                                        height: 170.0,
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "${repositories [index]['thumbnail']}"),
                                        // image:  NetworkImage("${listPerson[index].getThumbnail()}"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadiusDirectional.only(
                                          bottomEnd: Radius.circular(10.0),
                                          bottomStart: Radius.circular(10.0)),
                                      color: Color(0xFFeff1f2),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.only(top: 10.0, left: 20),
                                          child: Text(
                                            "${repositories [index]['title']}",
                                            style: new TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: ListTile(
                                                leading: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 30,
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    backgroundImage: NetworkImage(
                                                      "https://avatars0.githubusercontent.com/u/41331389?s=280&v=4",
                                                    ),
                                                  ),
                                                ),
                                                title: Text(
                                                  "${repositories [index]['user']['fullname']}",
                                                  style: new TextStyle(
                                                    fontFamily: 'sans-serif',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                    '${repositories [index]['views']} views | 1 month ago',
                                                    style: new TextStyle(
                                                      fontSize: 12.0,
                                                      color: Color(0xFF4d6890),
                                                    )),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: ShowPupPopMenu(
                                                index: index,
                                                id:repositories[index]['id'],
                                                org_id: repositories[index]['org_id'],
                                                title:  repositories[index]['title'],
                                                price: repositories[index]['price'],
                                                privacy:  repositories[index]['privacy'],
                                                category:  repositories[index]['category'],
                                                description: repositories[index]['description'],
                                                // refetchCourse: ,
                                                // onDeleteClick: onDeleteClick,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          
        ],
      ),
    );
  }
}