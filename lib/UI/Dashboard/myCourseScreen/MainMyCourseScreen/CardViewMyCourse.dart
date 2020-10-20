import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/Model/CourseModel.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/addSectionPointCourse.dart';
import 'package:koompi_academy_project/UI/Login/SharePreference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ShowPupPopMenu.dart';
import 'package:flutter/foundation.dart';

class CardViewMyCourse extends StatefulWidget {
  final Function refetchCourse;
  final String owner_id;
  CardViewMyCourse({Key key, this.refetchCourse,this.owner_id}) : super(key: key);

  @override
  _CardViewMyCourseState createState() => _CardViewMyCourseState();
}

class _CardViewMyCourseState extends State<CardViewMyCourse> {
  List<Course> listPerson = List<Course>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  bool _loadingCourse = true;
  int _count = 10;
  int _offset = 0;
ScrollController scrollController = new ScrollController();
  // MovieLoadMoreStatus loadMoreStatus = MovieLoadMoreStatus.STABLE;
  // CancelableOperation movieOperation;
  // int currentPageNumber;

  void fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getCourseByOwner(widget.owner_id)),
      ),
    );
    if (!result.hasException) {
      setState(() {
        for (var i = 0; i < result.data["courses_by_owner"].length; i++) {
          listPerson.add(
            Course(
              result.data["courses_by_owner"][i]["id"],
              result.data["courses_by_owner"][i]["org_id"],
              result.data["courses_by_owner"][i]["title"],
              result.data["courses_by_owner"][i]["privacy"],
              result.data["courses_by_owner"][i]["price"],
              result.data["courses_by_owner"][i]["categories"],
              result.data["courses_by_owner"][i]["thumbnail"],
              result.data["courses_by_owner"][i]["description"],
              result.data["courses_by_owner"][i]["owner_id"],
              result.data["courses_by_owner"][i]["user"]["fullname"],
              result.data["courses_by_owner"][i]["views"],
            ),
          );
           _loadingCourse = true;
        }
      });
       _loadingCourse = false;
    }
  }

  void onDeleteClick(int index) {
    setState(() {
      listPerson.removeAt(index);
      print('index $index');
    });
  }

    void onClickUpdateCourse() {
      setState(() {
        listPerson.clear();
        fillList();
      });
    }

//   bool onNotification(ScrollNotification notification) {
//   if (notification is ScrollUpdateNotification) {
//     if (scrollController.position.maxScrollExtent > scrollController.offset &&
//         scrollController.position.maxScrollExtent - scrollController.offset <=
//             50) {
//       if (loadMoreStatus != null &&
//         loadMoreStatus == MovieLoadMoreStatus.STABLE) {
//         loadMoreStatus = MovieLoadMoreStatus.LOADING;
//         movieOperation = CancelableOperation.fromFuture(injector
//             .movieRepository
//             .fetchMovies(currentPageNumber + 1)
//             .then((moviesObject) {
//           currentPageNumber = moviesObject.page;
//           loadMoreStatus = MovieLoadMoreStatus.STABLE;
//           setState(() => listPerson.addAll(moviesObject.movies));
//         }));
//       }
//     }
//   }
//   return true;
// }

  @override
  void initState() {
    fillList();
    super.initState();
    scrollController.addListener(() {
      double _pixels = scrollController.position.pixels;
      double _maxScroll = scrollController.position.maxScrollExtent;
      if (_pixels == _maxScroll) {
        fillList();
      }
    });
   }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: _loadingCourse == true ? Center(child:Image.asset("images/GifLoding.gif")): 
       ListView.builder(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
        itemCount: listPerson.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddSectionPointCourse(
                    course_id: listPerson[index].getId(),
                    course_title: listPerson[index].getTitle()),
              ));
            },
            child: listPerson.length == 0 ? Center(child: Text("No Course show")):
            Padding(
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
                          image: NetworkImage( "${listPerson[index].getThumbnail()}"),
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
                              "${listPerson[index].getTitle()}",
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
                                      backgroundImage: NetworkImage(
                                         "${listPerson[index].getThumbnail()}",                                       
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "${listPerson[index].getFullname()}",
                                    style: new TextStyle(
                                      fontFamily: 'sans-serif',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  subtitle: Text('${listPerson[index].getView()} views | 1 month ago',
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
                                  id: listPerson[index].getId(),
                                  org_id: listPerson[index].getOrg_id(),
                                  title: listPerson[index].getTitle(),
                                  price: listPerson[index].getPrice(),
                                  privacy: listPerson[index].getPrivacy(),
                                  category: listPerson[index].getCategories(),
                                  description: listPerson[index].getDescription(),
                                  refetchCourse: fillList,
                                  onDeleteClick: onDeleteClick,
                                  onUpdateClick: onClickUpdateCourse,
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
    );
  }
}
