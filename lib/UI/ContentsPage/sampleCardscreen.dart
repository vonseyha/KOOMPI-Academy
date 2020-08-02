import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Submainpage/DisplayVideoScreen/displayVideoScreen.dart';
import 'package:tuple/tuple.dart';

import 'Sliver_to_SubPage/Herowidget.dart';

// import 'detail.dart';
// import 'herowidget.dart';

class GridSample extends StatelessWidget{
  const GridSample({Key key}) : super(key: key);

  static const List<Tuple3> datamodel = [
    const Tuple3<String,String,String>(
      "https://learnbackend.koompi.com/uploads/chrome.png",
       "First App – Simple WebView",
       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    ),
    const Tuple3<String,String,String>(
      "https://learnbackend.koompi.com/uploads/nimbuscapture_colored_dark.png",
       "First App – Simple WebView",
       "https://www.youtube.com/embed/FZKtJmJAB8Y?autoplay=1&mute=0&controls=1&origin=https%3A%2F%2Facademy.koompi.com&playsinline=1&showinfo=0&rel=0&iv_load_policy=3&modestbranding=1&enablejsapi=1&widgetid=3",
    ),
    const Tuple3<String,String,String>(
      "https://learnbackend.koompi.com/uploads/1585145291_gimp_artwork.jpg",
       "First App – Simple WebView",
       "https://www.youtube.com/embed/FZKtJmJAB8Y?autoplay=1&mute=0&controls=1&origin=https%3A%2F%2Facademy.koompi.com&playsinline=1&showinfo=0&rel=0&iv_load_policy=3&modestbranding=1&enablejsapi=1&widgetid=3",
    ),
    const Tuple3<String,String,String>(
      "https://learnbackend.koompi.com/uploads/ecology.jpg",
       "First App – Simple WebView",
       "https://www.youtube.com/embed/FZKtJmJAB8Y?autoplay=1&mute=0&controls=1&origin=https%3A%2F%2Facademy.koompi.com&playsinline=1&showinfo=0&rel=0&iv_load_policy=3&modestbranding=1&enablejsapi=1&widgetid=3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverContent(),
      ],
    );
  }

  SliverFixedExtentList _buildSliverContent() {
    return SliverFixedExtentList(
      itemExtent: 110,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _buildListItem(context, datamodel[index]);
        },
        childCount: datamodel.length,
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Tuple3 tutorial) {
    return Stack(
      children: <Widget>[
        _buildCardView(tutorial.item2, tutorial.item1),
        _buildRippleEffectNavigation(context, tutorial.item2, tutorial.item1, tutorial.item3),
      ],
    );
  }

  Widget _buildCardView(String desc, String imageUrl) {
    return Positioned.fill(
        child: Card(
          margin: const EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                _buildHeroWidget(imageUrl),
                _buildDesc(desc),
              ],
            ),
          ),
    );
  }

  Expanded _buildDesc(String desc) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 0),
        child: Text(
          desc,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
  HeroWidget _buildHeroWidget(String imageUrl){
    return HeroWidget(
      width: 150,
      heroTag: imageUrl,
      builder: (BuildContext context) {
        return _buildHeroWidgetContent(imageUrl);
      },
    );
  }

  CachedNetworkImage _buildHeroWidgetContent(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildRippleEffectNavigation(
      BuildContext context, String desc, String imageUrl, String videoUrl) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.red.withOpacity(0.5),
          highlightColor: Colors.red.withOpacity(0.5),
          onTap: () {
            Navigator.of(context).push(
              _createTutorialDetailRoute(desc, imageUrl,videoUrl),
            );
          },
        ),
      ),
    );
  }

  PageRoute<Object> _createTutorialDetailRoute(desc, imageUrl,videoUrl) {
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