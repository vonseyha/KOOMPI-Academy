import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/api.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/dashboardMutation.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/addSectionPointCourse.dart';

import 'ShowPupPopMenu.dart';

class CardViewMyCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink(uri: 'https://academybackend.koompi.com/private/api');

    final ValueNotifier<GraphQLClient> linkclient =
        ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: OptimisticCache(
          dataIdFromObject: typenameDataIdFromObject,
        ),
      ),
    );

    return GraphQLProvider(
        client: linkclient,
        child: Query(
          options: QueryOptions(
            documentNode: gql(getAll),
          ),
          builder: (
            QueryResult result, {
            Refetch refetch,
            FetchMore fetchMore,
          }) {
            if (result.data != null) print(result.data['courses'][0]['id']);
            print(result.data['courses'][0]['thumbnail']);
            print(result.data['courses'][0]['description']);
            print(result.data['courses'][0]['title']);
            print(result.data['courses'][0]['price']);
            print(result.data['courses'][0]['privacy']);
            print(result.data['courses'][0]['categories']);
            print(result.data['courses'][0]['user']['fullname']);
            if (result.hasException) {
              print(result.exception.toString());
              return Text(result.exception.toString());
            }
            if (result.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (result.data == null) {
              print(result.data.toString());
              return Text("No Data Found!");
            }
            final coursesList = result.data['courses'];
            print(coursesList.length);
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddSectionPointCourse(),
                ));
              },
              child: ListView.builder(
                itemCount: coursesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2.0),
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
                                image: NetworkImage("${coursesList[index]['thumbnail']}"),
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
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 20),
                                  child: Text("${coursesList[index]['title']}",
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
                                            backgroundImage: NetworkImage("https://avatars0.githubusercontent.com/u/41331389?s=280&v=4"),
                                          ),
                                        ),
                                        title: Text(
                                          "${coursesList[index]['user']['fullname']}",
                                          style: new TextStyle(
                                            fontFamily: 'sans-serif',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        subtitle: Text('1K views | 1 month ago',
                                            style: new TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xFF4d6890),
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: ShowPupPopMenu(
                                        id:result.data['courses'][index]['id'],
                                        org_id: result.data['courses'][index]['org_id'],
                                        title: result.data['courses'][index]['title'],
                                        price: result.data['courses'][index]['price'],
                                        pravcy: result.data['courses'][index]['pravcy'],
                                        category: result.data['courses'][index]['category'],
                                        thumbnail: result.data['courses'][index]['thumbnail'],
                                        description: result.data['courses'][index]['description'],
                                        course_id: result.data['courses'][index]['course_id'],
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
                  );
                },
              ),
            );
          },
        ));
  }
}

// return Column(
//                     children: [
//                       Text("${coursesList[index]['thumbnail']}"),
//                       Text("${coursesList[index]['id']}"),
//                       Text("${coursesList[index]['description']}"),
//                       Text("${coursesList[index]['title']}"),
//                       Text("${coursesList[index]['price']}"),
//                       Text("${coursesList[index]['privacy']}"),
//                       Text("[${coursesList[index]['categories']}]"),
//                       // Text(result.data['courses']['user'][index]['fullname']),
//                       Text("$index"),
//                     ],
//                   );
