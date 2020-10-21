import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/datas.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/graphQLVideoConf.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/query.dart';
import 'package:koompi_academy_project/UI/Submainpage/CommentPage/commentScreen.dart';
import 'package:koompi_academy_project/UI/Submainpage/FregementScreen/overviewFregementScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Overview'),
    Tab(text: 'Content'),
  ];

  List<LinkVideo> list = List<LinkVideo>();
  GraphqlVideoConf graphqlVideoConf = GraphqlVideoConf();
  String video;
  String videoId;

  TabController _tabController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
    videoId = "aaCx0t9hD7Q";

    //-------------------------------Play Video ---------------------------------------//
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  ValueNotifier<GraphQLClient> clientdata = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: 'https://learnbackend.koompi.com/student'),
    ),
  );
  QueryData queryData = QueryData();

  @override
  Widget build(BuildContext context) {
    var datawh = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text(
          'KOOMPI Academy',
          style: new TextStyle(
            fontFamily: 'sans-serif',
            fontWeight: FontWeight.w500,
            // color: Colors.black
          ),
        ),
      ),
      body: Container(
          height: datawh.size.height,
          child: Column(
            children: <Widget>[
              YoutubePlayer(
                controller: _controller,
                liveUIColor: Colors.amber,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                onReady: () {
                  _isPlayerReady = true;
                },
                onEnded: (data) {
                  _controller.load(video);
                  _showSnackBar('Next Video Started!');
                },
              ),
              Expanded(
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
                length: 2,
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
                  height: datawh.size.height / 2.1,
                  child:
                      TabBarView(controller: _tabController, children: <Widget>[
                    ContentFregement(courseTitle: widget.course_Title),
                    GraphQLProvider(
                      client: clientdata,
                      child: Scaffold(
                          body: Query(
                        options: QueryOptions(
                            documentNode: gql(
                                queryData.getContentCourse(widget.course_Id)),
                            variables: {"course_id": "${widget.course_Id}"}),
                        builder: (QueryResult result,
                            {VoidCallback refetch, FetchMore fetchMore}) {
                          if (result.hasException) {
                            return Text(result.exception.toString());
                          }
                          if (result.loading) {
                            return Center(
                              child: SpinKitFadingCircle(
                                  color: Colors.blueGrey, size: 40),
                            );
                          }
                          List repositories = result.data['sections'];
                          return ListView.builder(
                            itemCount: repositories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ExpansionTile(
                                title: Text(
                                  "${repositories[index]["no"]}.\t${repositories[index]["title"]}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 17),
                                ),
                                children: <Widget>[
                                  if (result.data['sections'][index]
                                      .containsKey("points"))
                                    for (var a = 0;
                                        a <
                                            result
                                                .data['sections'][index]
                                                    ["points"]
                                                .length;
                                        a++)
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: GestureDetector(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Text(
                                              " ${repositories[index]["points"][a]["no"]}.\t${repositories[index]["points"][a]["title"]}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              videoId =
                                                  YoutubePlayer.convertUrlToId(
                                                      repositories[index]
                                                              ["points"][a]
                                                          ["video_link"]);
                                              _controller.load(videoId);
                                            });
                                          },
                                        ),
                                      ),
                                ],
                              );
                            },
                          );
                        },
                      )),
                    )
                  ]),
                ),
              )
            ],
          ))
        ]));
  }
}
