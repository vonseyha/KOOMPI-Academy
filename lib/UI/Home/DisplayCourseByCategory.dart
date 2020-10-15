import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/query.dart';
import 'package:koompi_academy_project/UI/Submainpage/DisplayVideoScreen/displayVideoScreen.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import 'detailcategory.dart';
import 'property.dart';

class DisplayCourseByCategories extends StatefulWidget {
  final String name;
  final String imagesvg;
  const DisplayCourseByCategories({Key key, this.name ,this.imagesvg}) : super(key: key);
  @override
  _DisplayCourseByCategoriesState createState() => _DisplayCourseByCategoriesState();
}

class _DisplayCourseByCategoriesState extends State<DisplayCourseByCategories> {
bool isCheck = false;
ValueNotifier<GraphQLClient> clientdata = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'https://learnbackend.koompi.com/student'),
  ),
);
QueryData queryData = QueryData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 25.0,
                    height: 25.0,
                    child: Image.asset("images/backone.png"),
                  ),
                ),
                Container(
                  child: Text(
                    toBeginningOfSentenceCase(widget.name),
                    //'${widget.name}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4.5,
              // color: Colors.blue,
                 child:Row(
                   children: [
                     Expanded(
                       child:SvgPicture.asset(widget.imagesvg,width: 100,height: 100), 
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 20.0),
                       child: Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Hey Alex,", style: kHeadingextStyle),
                              Text("New course for you ", style: kSubheadingextStyle),
                            ],
                         ),
                       ),
                     ),
                   ],
                 ),
            ),
             Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                   "${toBeginningOfSentenceCase(widget.name)} Courses",
                   textAlign: TextAlign.center,
                   style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                 ),
              ),
              Expanded(
                child: GraphQLProvider(
                  client: clientdata,
                  child: Query(
                    options: QueryOptions(
                        documentNode: gql(queryData.getCourseByCategories(widget.name))
                      ), 
                    builder: (QueryResult result, {VoidCallback refetch, FetchMore fetchMore}){
                      if (result.hasException) {
                        return Text('error');
                      }
                      if (result.loading) {
                        return Center(
                         child: SpinKitFadingCircle  (color: Colors.blueGrey, size: 50),
                      );
                      }
                      List repositories = result.data['courses_by_category'];
                      return ListView.builder(
                        itemCount: repositories.length,
                        itemBuilder: (BuildContext context ,int index){
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PortfolioTutorialDetailPage(
                                          course_Id: repositories[index]['id'],
                                          course_Title: repositories[index]['title'],
                                          )
                                        )
                                      );
                                  print('it will display the video');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
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
                                              image:
                                                isCheck
                                                ? SvgPicture.network("${repositories[index]['feature_image']}")
                                                : NetworkImage("${repositories[index]['feature_image']}"),
                                                // isCheck
                                                // ? NetworkImage("${list[index].getImage()}")
                                                // : SvgPicture.network("${list[index].getImage()}"),
                                                // isCheck
                                                // ? NetworkImage("${list[index].getImage()}")
                                                // : null,
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
                                                  "${repositories[index]['title']}",
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
                                                              "https://avatars0.githubusercontent.com/u/41331389?s=280&v=4"),
                                                        ),
                                                      ),
                                                      title: Text(
                                                        "${repositories[index]['user']['fullname']}",
                                                        style: new TextStyle(
                                                          fontFamily: 'sans-serif',
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                          '${repositories[index]['views']} views | 1 month ago',
                                                          style: new TextStyle(
                                                            fontSize: 12.0,
                                                            color: Color(0xFF4d6890),
                                                          )),
                                                    ),
                                                  ),
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
                      );
                    } ,
                    ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
