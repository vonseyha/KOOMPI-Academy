import 'package:flutter/material.dart';

class PortfolioSliverAppBar extends StatelessWidget {
  final String _title;

  const PortfolioSliverAppBar(
    this._title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return SliverAppBar(
      key: _scaffoldKey,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.blueAccent,
      expandedHeight: 200,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
          title: Text(
            _title,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          background: Container(
            color: Colors.white,
            child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset("images/coursenotfound.gif"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        //   child:
                        //       Icon(Icons.format_align_right, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
