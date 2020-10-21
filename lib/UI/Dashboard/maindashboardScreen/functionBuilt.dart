import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'Cliper.dart';

//********************TopBarDesign Dashboard**********************//
Widget TopBarDesign(String fullname) {
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
                 Color(0xFF4080D6),
                 Color(0xFF4080D6)
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
                  Text(fullname, style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: 'Sens-serif',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
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
