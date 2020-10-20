import 'package:flutter/material.dart';

class SlideTitle extends StatelessWidget {
  String imagePath, title, desc;
  SlideTitle({this.imagePath, this.title, this.desc});
  bool img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200.0,
            child: Image.asset(imagePath),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30.0,
              fontFamily: 'sans-serif',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: 'ans-serif',
              ))
        ],
      ),
    );
  }
}
