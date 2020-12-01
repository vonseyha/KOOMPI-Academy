import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/Model/CourseModel.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/addSectionPointCourse.dart';

import 'ShowPupPopMenu.dart';
import 'functionbuild.dart';

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
  bool _loadingCourse = true;
  String query;

  List deleteCourse;
  void onDeleteClick(int index) {
    setState(() {
      deleteCourse.removeAt(index);
      print('index $index');
    });
  }

  void onClickUpdateCourse() {
    setState(() {});
  }

  void fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode:
            gql(queryGraphQL.getCourseByOwner("5d52486a1adfbd764bd951f8")),
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

  List<Course> dummyListData;
  void filterSearchResults(String query) {
    List<Course> dummySearchList = List<Course>();
    dummySearchList.addAll(listPerson);
    if (query.isNotEmpty) {
      dummyListData = List<Course>();
      dummySearchList.forEach((item) {
        if (item.getTitle().contains(query)) {
          dummyListData.add(item);
        }else if(item.getTitle().contains(query) != item.getTitle()) {
          print("kkkkkk");
        }
      });
      setState(() {
        listPerson.clear();
        listPerson.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        listPerson.clear();
        fillList();
      });
    }
  }

  @override
  void initState() {
    fillList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 50,
              child: TextField(
                  controller: editingSearchController,
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
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
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
                    filterSearchResults(value);
                  }),
            ),
          ),
          Expanded(
            child: _loadingCourse == true
                ? Center(
                    child: Image.asset(
                    "images/gif.gif",
                    width: 120,
                  ))
                : ListView.builder(
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
                        child: listPerson.length.isNaN
                            ? Center(child: Text("No Course show"))
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 2.0),
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Color(0xFFc3c4c5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          child: Image(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 170.0,
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "${listPerson[index].getThumbnail()}"),
                                            // image:  NetworkImage("${listPerson[index].getThumbnail()}"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                                  bottomEnd:
                                                      Radius.circular(10.0),
                                                  bottomStart:
                                                      Radius.circular(10.0)),
                                          color: Color(0xFFeff1f2),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0, left: 20),
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
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 30,
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                          "${listPerson[index].getThumbnail()}",
                                                        ),
                                                      ),
                                                    ),
                                                    title: Text(
                                                      "${listPerson[index].getFullname()}",
                                                      style: new TextStyle(
                                                        fontFamily:
                                                            'sans-serif',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                        '${listPerson[index].getView()} views | 1 month ago',
                                                        style: new TextStyle(
                                                          fontSize: 12.0,
                                                          color:
                                                              Color(0xFF4d6890),
                                                        )),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: ShowPupPopMenu(
                                                    index: index,
                                                    id: listPerson[index]
                                                        .getId(),
                                                    org_id: listPerson[index]
                                                        .getOrg_id(),
                                                    title: listPerson[index]
                                                        .getTitle(),
                                                    price: listPerson[index]
                                                        .getPrice(),
                                                    privacy: listPerson[index]
                                                        .getPrivacy(),
                                                    category: listPerson[index]
                                                        .getCategories(),
                                                    description:
                                                        listPerson[index]
                                                            .getDescription(),
                                                    thumbnail: listPerson[index]
                                                        .getThumbnail(),
                                                    refetchCourse: fillList,
                                                    onDeleteClick:
                                                        onDeleteClick,
                                                    onUpdateClick:
                                                        onClickUpdateCourse,
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
      ),
    );
  }
}
