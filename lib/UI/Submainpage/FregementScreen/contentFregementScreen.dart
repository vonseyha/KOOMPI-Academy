import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/query.dart';

class FregementContent extends StatefulWidget {
  final String courseID;
  FregementContent({Key key, this.courseID}) : super(key: key);

  @override
  _FregementContentState createState() => _FregementContentState();
}

class _FregementContentState extends State<FregementContent> {
  ValueNotifier<GraphQLClient> clientdata = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: 'https://learnbackend.koompi.com/student'),
    ),
  );
  QueryData queryData = QueryData();

  @override
  Widget build(BuildContext context) {
    var datawh = MediaQuery.of(context);
    return GraphQLProvider(
      client: clientdata,
      child: Scaffold(
          body: Query(
        options: QueryOptions(
          documentNode: gql(queryData.getContentCourse(widget.courseID)),
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.loading) {
            return Center(
                 child: SpinKitFadingCircle  (color: Colors.blueGrey, size: 40),
              );
          }
          List repositories = result.data['sections'];
          return ListView.builder(
            itemCount: repositories.length,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionTile(
                title: Text(
                  " ${repositories[index]["no"]}.\t${repositories[index]["title"]}",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 17),
                ),
                children: <Widget>[
                  if (result.data['sections'][index].containsKey("points"))
                    for (var a = 0;
                        a < result.data['sections'][index]["points"].length;
                        a++)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                          child:  Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(" ${repositories[index]["points"][a]["no"]}.\t${repositories[index]["points"][a]["title"]}",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 14),
                              ),
                          ),
                      ),
                ],
              );
            },
          );
        },
      )),
    );
  }
}
