import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/datas.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/graphQLVideoConf.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/query.dart';
import 'package:koompi_academy_project/UI/Submainpage/DisplayVideoScreen/displayVideoScreen.dart';
import 'package:tuple/tuple.dart';

class SampleGrid extends StatefulWidget {
  const SampleGrid({Key key}) : super(key: key);

  static const List<Tuple3> datamodel = [
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/asdasd1.png",
      "Simple Name",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/nimbuscapture_colored_dark.png",
      "Simple Name",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/krita.png",
      "Simple Name",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/koompi-tutorial.png",
      "Simple Name",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/kdenlive-logo.png.webp",
      "Simple Name",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/a.png",
      "Simple Name",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
  ];

  @override
  _SampleGridState createState() => _SampleGridState();
}

class _SampleGridState extends State<SampleGrid> {
  List<VideoDatas> list = List<VideoDatas>();
  GraphqlVideoConf graphqlVideoConf = GraphqlVideoConf();

  void fillList() async {
    QueryData queryData = QueryData();
    GraphQLClient client = graphqlVideoConf.clientToQuery();
    QueryResult result = await client
        .query(QueryOptions(documentNode: gql(queryData.getVideoSection())));
    if (!result.hasException) {
      for (var i = 0; i < result.data["courses"].length; i++) {
        setState(() {
          list.add(VideoDatas(
            result.data["courses"][i]["id"],
            result.data["courses"][i]["title"],
            result.data["courses"][i]["feature_image"],
            result.data["courses"][i]["views"],
            result.data["courses"][i]["user"]["fullname"],
            result.data["courses"][i]["user"]["avatar"],
          ));
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverContent(),
      ],
    );
  }

  SliverFixedExtentList _buildSliverContent() {
    return SliverFixedExtentList(
      itemExtent: 324.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          SizedBox(width: 10);
          return _buildListItem(context, SampleGrid.datamodel[index]);
        },
        childCount: list.length,
        // childCount: SampleGrid.datamodel.length,
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Tuple3 tutorial) {
    return Stack(
      children: <Widget>[
        _buildCardView(context, tutorial.item2, tutorial.item1),
        _buildRippleEffectNavigation(
            context, tutorial.item2, tutorial.item1, tutorial.item3),
      ],
    );
  }

  Widget _buildCardView(BuildContext context, String desc, String imageUrl) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                      height: 210.0,
                      fit: BoxFit.cover,
                      image: NetworkImage("${list[index].getImage()}"),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(10.0),
                          bottomStart: Radius.circular(10.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.white,
                            Colors.white70,
                            Color(0xFFeff1f2),
                          ])),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(top: 10.0, left: 20),
                        child: Text(
                          "${list[index].getTitle()}",
                          style: new TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Serif',
                          ),
                        ),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                NetworkImage("${list[index].getAvatar()}"),
                          ),
                        ),
                        title: Text(
                          "${list[index].getFullname()}",
                          style: new TextStyle(
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                          ),
                        ),
                        subtitle:
                            Text('${list[index].getView()} views | 1 month ago',
                                style: new TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFF4d6890),
                                )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRippleEffectNavigation(
      BuildContext context, String desc, String imageUrl, String videoUrl) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blue.withOpacity(0.5),
          onTap: () {
            Navigator.of(context).push(
              _createTutorialDetailRoute(desc, imageUrl, videoUrl),
            );
          },
        ),
      ),
    );
  }

  PageRoute<Object> _createTutorialDetailRoute(desc, imageUrl, videoUrl) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 100),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.ease))
              .animate(animation),
          child: FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: Curves.ease))
                .animate(animation),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) =>
          PortfolioTutorialDetailPage(
        heroTag: imageUrl,
        desc: desc,
        videoUrl: videoUrl,
      ),
    );
  }
}
