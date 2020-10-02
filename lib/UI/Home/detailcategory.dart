import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Submainpage/DisplayVideoScreen/displayVideoScreen.dart';
import 'package:tuple/tuple.dart';

class DetailCard extends StatefulWidget {
  final String name;
  const DetailCard({Key key, this.name}) : super(key: key);

  static const List<Tuple3> datamodel = [
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/asdasd1.png",
      "First App – Simple WebVievideoUrlw",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/nimbuscapture_colored_dark.png",
      "First App – Simple WebView",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/asdasd1.png",
      "First App – Simple WebView",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/nimbuscapture_colored_dark.png",
      "First App – Simple WebView",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/asdasd1.png",
      "First App – Simple WebView",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String, String, String>(
      "https://learnbackend.koompi.com/uploads/nimbuscapture_colored_dark.png",
      "First App – Simple WebView",
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
  ];

  @override
  _DetailCardState createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: <Widget>[
          _isClicked == false
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isClicked = true;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _isClicked = false;
                    });
                  })
        ],
        bottom: _isClicked == true
            ? PreferredSize(
                preferredSize: Size(50, 60),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.amber,
                            ),
                            hintText: 'Find Somethings...'),
                      ),
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: CustomScrollView(
          slivers: <Widget>[
            _buildSliverContent(),
          ],
        ),
      ),
    );
  }

  SliverFixedExtentList _buildSliverContent() {
    return SliverFixedExtentList(
      itemExtent: 320.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          SizedBox(width: 10);
          return _buildListItem(context, DetailCard.datamodel[index]);
        },
        childCount: DetailCard.datamodel.length,
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
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
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
                      /////////////////////////////
                      /////////////////////////////
                      /// replace image here

                      image: NetworkImage(
                          "https://learnbackend.koompi.com/uploads/a.png"),
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
                            Colors.white54,
                            Color(0xFFeff1f2),
                          ])),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(top: 10.0, left: 20),
                        /////////////////////////////
                        /////////////////////////////
                        /// replace title here
                        child: Text(
                          "Google Chrome",
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
                            backgroundImage: NetworkImage(
                                "https://avatars0.githubusercontent.com/u/41331389?s=280&v=4"),
                          ),
                        ),
                        title: Text(
                          "Tang Eamseng",
                          style: new TextStyle(
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                          ),
                        ),
                        subtitle: Text('1K views | 1 month ago',
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
      transitionDuration: Duration(milliseconds: 200),
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
        // heroTag: videoUrl,
        videoUrl: videoUrl,
      ),
    );
  }
}
