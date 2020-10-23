import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/query.dart';

class ContentFregement extends StatefulWidget {
  final String courseTitle;
  ContentFregement({Key key, this.courseTitle}) : super(key: key);

  @override
  _ContentFregementState createState() => _ContentFregementState();
}

class _ContentFregementState extends State<ContentFregement> {
  ValueNotifier<GraphQLClient> clientdata = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: 'https://learnbackend.koompi.com/student'),
    ),
  );
  QueryData queryData = QueryData();
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: clientdata,
      child: Scaffold(
          body: Query(
              options: QueryOptions(
                  documentNode:
                      gql(queryData.getOverviewCourse(widget.courseTitle))),
              builder: (QueryResult result,
                  {VoidCallback refetch, FetchMore fetchMore}) {
                if (result.hasException) {
                  return Text('error');
                }
                if (result.loading) {
                  return Center(
                    child:
                        SpinKitFadingCircle(color: Colors.blueGrey, size: 40),
                  );
                }

                var dataw = MediaQuery.of(context);
                List repositories = result.data['courses_by_search'];
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    var desc;
                    var string = repositories[index]['description'];
                    for (var i = 0; i < string.length; i++) {
                      desc =  string.replaceAll('<p>', '').replaceAll('</p>', '');
                    }

                    return Column(
                      children: <Widget>[
                        Container(
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: new Text(
                                widget.courseTitle,
                                style: new TextStyle(
                                  fontFamily: 'Quicksand,sans-serif',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: dataw.size.width,
                            padding: const EdgeInsets.all(20.0),
                            child: new Text(
                              '$desc',
                              textAlign: TextAlign.justify,
                              style: new TextStyle(
                                fontFamily: 'Quicksand,sans-serif!important',
                                color: Colors.black,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              })),
    );
  }
}
