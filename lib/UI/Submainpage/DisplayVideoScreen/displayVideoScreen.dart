import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/datas.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/graphQLVideoConf.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/query.dart';
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
  final String course_Title;

  const PortfolioTutorialDetailPage(
      {Key key, @required this.course_Id, this.course_Title})
      : super(key: key);

  @override
  _PortfolioTutorialDetailPageState createState() =>
      _PortfolioTutorialDetailPageState();
}

class _PortfolioTutorialDetailPageState
    extends State<PortfolioTutorialDetailPage>
    with SingleTickerProviderStateMixin {
  ChewieController _chewieController;
  Future<void> _initializeVideoPlayerFuture;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Overview'),
    Tab(text: 'Content'),
  ];

  ValueNotifier<GraphQLClient> clientdata = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: 'https://learnbackend.koompi.com/student'),
    ),
  );
  QueryData queryData = QueryData();
  String video;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    print('video+++++++++++++++++++++++++++++$video');
    _chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.network('$video'), //$video
        aspectRatio: 16 / 9,
        autoInitialize: true,
        autoPlay: true,
        // autoInitialize: false,
        // autoPlay: false,
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
    var datawh = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colors,
        title: new Text(
          'KOOMPI Academy',
          style: new TextStyle(
            fontFamily: 'sans-serif',
            fontWeight: FontWeight.w500,
            // color: Colors.black
          ),
        ),
      ),
      body: GraphQLProvider(
        client: clientdata,
        child: Query(
          options: QueryOptions(
              documentNode: gql(queryData.getContentCourse(widget.course_Id))),
          builder: (result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.loading) {
              return Center(
                child: SpinKitFadingCircle(color: Colors.blueGrey, size: 40),
              );
            }
            List repositories = result.data['sections'];
            return ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                //add string here to do the equalty
                // video = repositories[index]['points'][index]['video_link'];
                if (result.data['sections'][index].containsKey("points")) {
                  for (var i = 0;
                      i < result.data['sections'][index]['points'].length;
                      i++) {
                    video = result.data['sections'][index]['points'][i]
                        ['video_link'];
                  }
                }
                print('LINKvideo___________$video');
                return Container(
                    height: datawh.size.height,
                    child: Column(
                      children: <Widget>[
                        _buildHeroWidget(context),
                        Expanded(
                          child: _buildDesc(context),
                        )
                      ],
                    ));
              },
            );
          },
        ),
      ),
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
                    ContentFregement(courseTitle: widget.course_Title),
                    FregementContent(courseID: widget.course_Id),
                  ]),
                ),
              )
            ],
          ))
        ]));
  }
}
