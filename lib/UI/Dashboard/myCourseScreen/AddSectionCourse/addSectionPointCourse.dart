import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/Model/SectionModel.dart';
import 'package:koompi_academy_project/UI/ContentsPage/Sliver_to_SubPage/sliverAppbar.dart';
import 'package:koompi_academy_project/UI/ContentsPage/Sliver_to_SubPage/sliver_persistent_header.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:tuple/tuple.dart';
import 'AddPoint.dart';
import 'AddSection.dart';
import 'menu_drawer.dart';

class AddSectionPointCourse extends StatefulWidget {
  final String course_id;
  final String course_title;

  const AddSectionPointCourse({

    Key key,
    this.course_id,
    this.course_title,
  }):super(key:key);

  @override
  _AddSectionPointCourseState createState() => _AddSectionPointCourseState();
}

class _AddSectionPointCourseState extends State<AddSectionPointCourse>  with SingleTickerProviderStateMixin {

  final List<Tuple3> _pages = [
    Tuple3('Add Section', AddSection(), Icon(Icons.video_library)),
    Tuple3('Add Point', AddPoint(), Icon(Icons.image)),
  ];

  TabController _tabController;

  @override
  void initState() {
    fillList();
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() => setState(() {
    }));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<dynamic> listSection = List<dynamic>();
  var items = List<String>();
GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

 String value1;
 String value2;
 String value3;
 String value4;
 bool value5;
 String value6;
 String value7 ;

  void fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getSections(widget.course_id)),
      ),
    );
    if (!result.hasException) {
      // listSection.add(result.data['sections']);
      listSection = List.from(result.data['sections']);
      int pointLength = listSection.length;
      for (int i = 0; i <pointLength; i++ ){
        // print("${listSection[i]['no']}\n");
      }

      // for (var i = 0; i < result.data["sections"].length; i++) {
      //            print("${result.data["sections"][i]["id"]}");
      //            print("${ result.data["sections"][i]["course_id"]}");0
      //            print("${ result.data["sections"][i]["no"]}");
      //            print("${ result.data["sections"][i]["title"]}");
      //            print("${ result.data["sections"][i]["message"]}");
      //   if (result.data['sections'][i].containsKey("points")){
      //     for (var a = 0; a <result.data['sections'][i]["points"].length;a++){
      //         print("${result.data["sections"][i]['points'][a]["id"]}");
      //         print("${result.data["sections"][i]['points'][a]["no"]}");
      //         print("${result.data["sections"][i]['points'][a]["title"]}");
      //         print("${result.data["sections"][i]['points'][a]["video_link"]}");
      //         print("${result.data["sections"][i]['points'][a]["preview"]}");
      //         print("${result.data["sections"][i]['points'][a]["section_id"]}");
      //         print("${result.data["sections"][i]['points'][a]["message"]}");
      //     }
        }
        // setState(() {
        //       listSection.add(
        //         Section(
        //           result.data["sections"][i]["id"],
        //           result.data["sections"][i]["course_id"],
        //           result.data["sections"][i]["no"],
        //           result.data["sections"][i]["title"],
        //           result.data["sections"][i]["message"],
        //           value1,
        //           value2,
        //           value3,
        //           value4,
        //           value5,
        //           value6,
        //           value7,
        //         ),
        //       );
        //     });
            // print("SectionNO === ${listSection[i].getSectionNo()} \t${listSection[i].getSectionTitle()}");
            // print("PointsNO === ${listSection[i].getPointNo()} \t ${listSection[i].getPointTitle()}");
      // }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            PortfolioSliverAppBar(_pages[_tabController.index].item1),
            SliverPersistentHeader(
              delegate: SliverPersistentHeaderDelegateImpl(
                tabBar: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  tabs: _pages
                      .map<Tab>((Tuple3 page) => Tab(text: page.item1))
                      .toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
                    AddSection(courseId: widget.course_id, courseTitle: widget.course_title),
                    AddPoint(courseId: widget.course_id),
                  ]
        ),
      ),
      endDrawer: ClipPath(
          child: EndDrawer(
            courseId: widget.course_id,
            refetchdata: fillList,
          ),
          ),
    );
  }
}
