import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/Model/CourseModel.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/addSectionPointCourse.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/MainMyCourseScreen/ShowPupPopMenu.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/MainMyCourseScreen/functionbuild.dart';
import '../../../../constants.dart';

class MyCourse extends StatefulWidget {
  final String owner_id;
  MyCourse({Key key, this.owner_id}) : super(key: key);
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  List<Course> listPerson = List<Course>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  bool _loadingCourse = true;
  int value;
  int value1;
  void fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getCourseByOwner(widget.owner_id)),
      ),
    );
    if (!result.hasException) {
      for (var i = 0; i < result.data["courses_by_owner"].length; i++) {
        setState(() {
          value = result.data["courses_by_owner"].length;
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
        });
        _loadingCourse = true;
      }
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

  //---------------------------------- Search Method --------------------------------------------//

  void filterSearchResults(String query) {
    List<Course> dummySearchList = List<Course>();
    dummySearchList.addAll(listPerson);
    if (query.isNotEmpty) {
      List<Course> dummyListData = List<Course>();
      dummySearchList.forEach((item) {
        if (item.getTitle().contains(query)) {
          dummyListData.add(item);
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
        value1 = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fillList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size * 0.3,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  height: size * 0.3 - 27,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 18.0,
                                          height: 18.0,
                                          child: Image.asset(
                                              "images/backone.png",
                                              color: Colors.white),
                                        ),
                                        Container(
                                          child: Text("back",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Here!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold)),
                                  Text("Your course.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 4,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        height: 75,
                        width: 115,
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: value == null
                              ? Expanded(
                                  child:Image.asset("images/gif.gif", width: 60))
                              : Column(
                                  children: [
                                    Text(
                                      '$value',
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Sans-serif'),
                                    ),
                                    const Text("Courses",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Sans-serif')),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              filterSearchResults(value);
                            },
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                        child: listPerson.length == 0
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
                                                    id: listPerson[index] .getId(),
                                                    org_id: listPerson[index] .getOrg_id(),
                                                    title: listPerson[index]  .getTitle(),
                                                    price: listPerson[index].getPrice(),
                                                    privacy: listPerson[index].getPrivacy(),
                                                    category: listPerson[index] .getCategories(),
                                                    description: listPerson[index]  .getDescription(),
                                                    thumbnail: listPerson[index].getThumbnail(),
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
