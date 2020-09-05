import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/ContentsPage/Sliver_to_SubPage/sliverAppbar.dart';
import 'package:koompi_academy_project/UI/ContentsPage/Sliver_to_SubPage/sliver_persistent_header.dart';
import 'package:tuple/tuple.dart';
import 'AddPoint.dart';
import 'AddSection.dart';

class AddSectionPointCourse extends StatefulWidget {
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
          clipper: _DrawerClipper(),
          child: EndDrawer()),
    );
  }
}

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Icon(Icons.more_horiz,size: 25),
                    ),
                    title: Text(
                      "Title One",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("1. children One",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2. children Two",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("3. children Three",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4. children Four",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("5. children Five",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Icon(Icons.more_horiz,size: 25),
                    ),
                    title: Text(
                      "Title Two",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("1. children One",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2. children Two",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("3. children Three",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4. children Four",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("5. children Five",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Icon(Icons.more_horiz,size: 25),
                    ),
                    title: Text(
                      "Title Three",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("1. children One",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2. children Two",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("3. children Three",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4. children Four",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("5. children Five",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Icon(Icons.more_horiz,size: 25),
                    ),
                    title: Text(
                      "Title Four",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("1. children One",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2. children Two",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("3. children Three",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4. children Four",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("5. children Five",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Icon(Icons.more_horiz,size: 25),
                    ),
                    title: Text(
                      "Title Five",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("1. children One",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2. children Two",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("3. children Three",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4. children Four",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("5. children Five",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Icon(Icons.more_horiz,size: 25),
                    ),
                    title: Text(
                      "Title Six",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("1. children One",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2. children Two",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("3. children Three",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4. children Four",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("5. children Five",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.edit,size:15),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class _DrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(50, 0);
    path.quadraticBezierTo(0, size.height / 2, 50, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
