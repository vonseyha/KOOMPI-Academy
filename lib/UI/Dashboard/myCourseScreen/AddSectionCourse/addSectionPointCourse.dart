import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/ContentsPage/Sliver_to_SubPage/sliverAppbar.dart';
import 'package:koompi_academy_project/UI/ContentsPage/Sliver_to_SubPage/sliver_persistent_header.dart';
import 'package:tuple/tuple.dart';
import 'AddPoint.dart';
import 'AddSection.dart';
import 'menu_drawer.dart';

class AddSectionPointCourse extends StatefulWidget {
  final String course_id;

  const AddSectionPointCourse({
    Key key,
    this.course_id
  }):super(key:key);

  @override
  _AddSectionPointCourseState createState() => _AddSectionPointCourseState();
}

class _AddSectionPointCourseState extends State<AddSectionPointCourse>
    with SingleTickerProviderStateMixin {

  final List<Tuple3> _pages = [
    Tuple3('Add Section', AddSection(), Icon(Icons.video_library)),
    Tuple3('Add Point', AddPoint(), Icon(Icons.image)),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var datawh = MediaQuery.of(context);
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
          children: _pages.map<Widget>((Tuple3 page) => page.item2).toList(),
          
        ),
      ),
      endDrawer: ClipPath(
          // clipper: _DrawerClipper(),
          child: EndDrawer(),
        
          ),
    );
  }
}
