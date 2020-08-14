import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Submainpage/DisplayVideoScreen/displayVideoScreen.dart';
import 'package:tuple/tuple.dart';

class DetailCard extends StatefulWidget {
  final String name;
  const DetailCard({Key key, this.name}) : super(key: key);

  static const List<Tuple3> datamodel = [
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

///////////////////////////////////
/////////To do task today//////////
///////////////////////////////////
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
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSliverContent(),
        ],
      ),
    );
  }

  SliverFixedExtentList _buildSliverContent() {
    return SliverFixedExtentList(
      itemExtent: 340.0,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: DetailCard.datamodel.length,
          itemBuilder: (ctx, i) {
            return GestureDetector(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFc6c6c6),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10.0)),
                        child: Image(
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          fit: BoxFit.cover,
                          image: NetworkImage(imageUrl),
                        ),
                      ),
                    ),
                    Container(
                      height: 110.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(10.0),
                            bottomStart: Radius.circular(10.0)),
                        color: Colors.white,
                        // color: Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: new Text(
                                  "Google Chrome",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                )),
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: NetworkImage(
                                      "https://myphsar-ror.s3.ap-south-1.amazonaws.com/production_store/71bc0f27e89f0ff46f5e85bde940e985.png"),
                                ),
                              ),
                              title: Text(
                                desc,
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
                    ),
                  ],
                ),
              ),
            );
          }),
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
      transitionDuration: Duration(seconds: 1),
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
