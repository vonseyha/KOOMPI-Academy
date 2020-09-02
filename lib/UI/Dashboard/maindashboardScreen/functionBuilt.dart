import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'Cliper.dart';

//********************TopBarDesign Dashboard**********************//
Widget TopBarDesign() {
  return ClipPath(
    clipper: MyCliper(),
    child: Container(
      height: 230.0,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3793f9),
                Color(0xFF36aff8),
              ]),
          image: DecorationImage(
              image: AssetImage("images/backg.png"), fit: BoxFit.cover)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hey Alex,", style: kHeadingextStyle),
                  Text("Welcome to your course!",
                      style: TextStyle(
                          color: Colors.grey[100], fontSize: 15, height: 1.5)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: 'Sens-serif',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset("images/dashboard.png"),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
