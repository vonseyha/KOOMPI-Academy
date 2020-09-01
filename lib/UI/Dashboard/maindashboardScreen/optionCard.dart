import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionCard extends StatelessWidget {
  final String SvgSrc;
  final String title;
  final int color;
  const OptionCard({
    Key key, this.SvgSrc, this.title,this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("Hello");
      },
      child: Container(
        height: 140.0,
        width: 120.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),  
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 60.0,
                width: 60.0,
                child:SvgPicture.asset(SvgSrc,color: Color(color)),
              ),
            ),
            Text(
              title,
              style: Theme.of(context)
                .textTheme
                .body2
                .copyWith(
                  color: Color(0xFF3f597f),
                  fontSize: 16.0
                ),
            ),
          ],
        ),
      ),
    );
  }
}
