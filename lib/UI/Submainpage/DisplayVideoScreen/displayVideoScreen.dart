import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/graphQLVideoConf.dart';
import 'package:koompi_academy_project/Model/CardContentModel/sectionModel.dart';
import 'package:koompi_academy_project/UI/ContentsPage/Sliver_to_SubPage/Herowidget.dart';
import 'package:koompi_academy_project/UI/Submainpage/CommentPage/commentScreen.dart';
import 'package:koompi_academy_project/UI/Submainpage/FregementScreen/contentFregementScreen.dart';
import 'package:koompi_academy_project/UI/Submainpage/FregementScreen/overviewFregementScreen.dart';
import 'package:tuple/tuple.dart';
import 'package:video_player/video_player.dart';
import 'package:page_transition/page_transition.dart';

class PortfolioTutorialDetailPage extends StatefulWidget {
  final String course_Id;

  const PortfolioTutorialDetailPage({
    Key key,
    @required this.course_Id,
  }) : super(key: key);

  @override
  _PortfolioTutorialDetailPageState createState() =>
      _PortfolioTutorialDetailPageState();
}

class _PortfolioTutorialDetailPageState
    extends State<PortfolioTutorialDetailPage>
    with SingleTickerProviderStateMixin {
  ChewieController _chewieController;
  Future<void> _initializeVideoPlayerFuture;

  final List<Tuple3> _fregement = [
    Tuple3('OVERVIEW', ContentFregement(), Icon(Icons.view_day)),
    Tuple3('CONTENT', FregementContent(), Icon(Icons.view_day)),
  ];

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Overview'),
    Tab(text: 'Content'),
  ];

  List<SectionModel> list = List<SectionModel>();
  GraphqlVideoConf graphqlVideoConf = GraphqlVideoConf();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.network("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
        aspectRatio: 16 / 9,
        autoInitialize: true,
        autoPlay: true,
        looping: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    print("++++++++${widget.course_Id}");
    var datawh = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFf9b62f),
        title: new Text(
          'KOOMPI Academy',
          style: new TextStyle(
            fontFamily: 'sans-serif',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
          height: datawh.size.height,
          child: Column(
            children: <Widget>[
              _buildHeroWidget(context),
              Expanded(
//              height: datawh.size.height / 1.68,
                child: _buildDesc(context),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.leftToRight,
              child: FregementAnswer(),
            ),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.question_answer),
      ),
    );
  }

  HeroWidget _buildHeroWidget(BuildContext context) {
    return HeroWidget(
      heroTag: widget.course_Id,
      width: MediaQuery.of(context).size.width,
      builder: (BuildContext context) {
        return _buildHeroWidgetContent();
      },
    );
  }

  Chewie _buildHeroWidgetContent() {
    return Chewie(controller: _chewieController);
  }

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildDesc(BuildContext context) {
    var datawh = MediaQuery.of(context);
    print(datawh);
    return Container(
        height: datawh.size.height / 2,
        color: Colors.white,
        child: Column(children: <Widget>[
          Container(
              child: Column(
            children: <Widget>[
              DefaultTabController(
                length: 2, // Added
                child: Container(
                  height: datawh.size.height / 13,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Expanded(
                        child: new Text(
                          'OVERVIEW',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          'CONTENT',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ],
                    unselectedLabelColor: Colors.grey[600],
                    indicatorColor: Colors.blueAccent,
                    labelColor: Colors.blueAccent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 2.0,
                    indicatorPadding: EdgeInsets.all(10),
                    isScrollable: false,
                  ),
                ),
              ),
              DefaultTabController(
                length: 2,
                child: Container(
                  height: datawh.size.height / 1.95,
                  child:
                      TabBarView(controller: _tabController, children: <Widget>[
                    ContentFregement(),
                    FregementContent(),
                  ]),
                ),
              )
            ],
          ))
        ]));
  }
}
