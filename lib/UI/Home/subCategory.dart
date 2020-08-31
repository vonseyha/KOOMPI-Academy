import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../constants.dart';
import 'detailcategory.dart';
import 'property.dart';

class SubCagateory extends StatefulWidget {
  final String name;
  const SubCagateory({Key key, this.name}) : super(key: key);
  @override
  _SubCagateoryState createState() => _SubCagateoryState();
}

class _SubCagateoryState extends State<SubCagateory> {
  List bannerAdSlider = [
    "images/banner1.jpg",
    "images/banner2.jpg",
    "images/banner3.jpg",
    "images/banner4.jpg",
    "images/banner5.jpg",
    "images/banner6.jpg",
    "images/banner7.jpg",
    "images/banner8.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    child: Image.asset("images/backone.png"),
                  ),
                ),
                Container(
                  child: Text(
                    '${widget.name}',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height / 4,
                 child:Row(
                   children: [
                     Expanded(
                       child:Image.asset("images/img3.png"), 
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 20.0),
                       child: Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Hey Alex,", style: kHeadingextStyle),
                              Text("New course for you ", style: kSubheadingextStyle),
                            ],
                         ),
                       ),
                     ),
                   ],
                 ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 2), 
                        ),
                      ],
                    ),
                    height: 120,
                    width: 115,
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            "122",
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Sans-serif'),
                          ),
                          const Text("Course",
                              style: TextStyle(
                                  fontSize: 15, fontFamily: 'Sans-serif')),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 2), 
                        ),
                      ],
                    ),
                    height: 120,
                    width: 115,
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            "36",
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Sans-serif'),
                          ),
                          const Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 15, fontFamily: 'Sans-serif'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              "Category",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            // banner ad slider
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 14 / 9,
                autoPlay: true,
              ),
              items: bannerAdSlider.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                         onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => DetailCard(name:"Cambodia Club")));
                          },
                        child: Expanded(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image(
                                  height: 170.0,
                                  image: AssetImage(i),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                height: 30.0,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Cambodia Club",
                                  style: TextStyle(
                                      fontSize: 17.0, 
                                      fontWeight: FontWeight.w400,
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
