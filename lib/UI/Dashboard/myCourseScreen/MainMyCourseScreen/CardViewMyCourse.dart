import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/Model/CourseModel.dart';
import 'package:koompi_academy_project/UI/Dashboard/myCourseScreen/AddSectionCourse/addSectionPointCourse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ShowPupPopMenu.dart';
import 'functionbuild.dart';

class CardViewMyCourse extends StatefulWidget {
  final Function refetchCourse;
  CardViewMyCourse({Key key, this.refetchCourse}) : super(key: key);

  @override
  _CardViewMyCourseState createState() => _CardViewMyCourseState();
}

class _CardViewMyCourseState extends State<CardViewMyCourse> {
  List<Course> listPerson = List<Course>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  void fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getAll()),
      ),
    );
    if (!result.hasException) {
      setState(() {
        for (var i = 0; i < result.data["courses"].length; i++) {
          listPerson.add(
            Course(
              result.data["courses"][i]["id"],
              result.data["courses"][i]["org_id"],
              result.data["courses"][i]["title"],
              result.data["courses"][i]["privacy"],
              result.data["courses"][i]["price"],
              result.data["courses"][i]["categories"],
              result.data["courses"][i]["thumbnail"],
              result.data["courses"][i]["description"],
              result.data["courses"][i]["owner_id"],
              result.data["courses"][i]["user"]["fullname"],
              result.data["courses"][i]["views"],
            ),
          );
        }
      });
    }
  }

  void onDeleteClick(int index) {
    setState(() {
      listPerson.removeAt(index);
      print('index $index');
    });
  }

   Future<void> saveString(String key, String course_title , String status , String category , String description , int price) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(key, course_title);
  }

  @override
  void initState() {
    fillList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
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
                              "https://learnbackend.koompi.com/uploads/240_f_77895837_ku3q9pvs1dpxr2ma0myvsa2ylqtgtqut.jpg"),
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
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                        "https://avatars0.githubusercontent.com/u/41331389?s=280&v=4",
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
                                  subtitle: Text(
                                      '${listPerson[index].getView()} views | 1 month ago',
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
                                  // tage_mode: ,
                                  // thumbnail: listPerson[index].getThumbnail(),
                                  description:
                                      listPerson[index].getDescription(),
                                  refetchCourse: fillList,
                                  onDeleteClick: onDeleteClick,
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
