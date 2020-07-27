import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';

class Items {
  String img;
  String title;
  String name;
  String viewCount;
  String period;

  Items({this.img, this.title, this.name, this.viewCount, this.period});
}

// ignore: must_be_immutable
class HomeGridView extends StatelessWidget {
  Items item1 = new Items(
    img: "images/koompi_icon.png",
    title: "Calendar",
    name: "March Daian",
    viewCount: "300 views",
    period: "three months ago",
  );
  Items item2 = new Items(
    img: ("images/koompi_icon.png"),
    title: "Calendar",
    name: "March Daian",
    viewCount: "300 views",
    period: "three months ago",
  );
  Items item3 = new Items(
    img: ("images/koompi_icon.png"),
    title: "Calendar",
    name: "March Daian",
    viewCount: "300 views",
    period: "three months ago",
  );
  Items item4 = new Items(
    img: ("images/koompi_icon.png"),
    title: "Calendar",
    name: "March Daian",
    viewCount: "300 views",
    period: "three months ago",
  );
  Items item5 = new Items(
    img: ("images/koompi_icon.png"),
    title: "Calendar",
    name: "March Daian",
    viewCount: "300 views",
    period: "three months ago",
  );
  Items item6 = new Items(
    img: ("images/koompi_icon.png"),
    title: "Calendar",
    name: "March Daian",
    viewCount: "300 views",
    period: "three months ago",
  );
  Items item7 = new Items(
    img: ("images/koompi_icon.png"),
    title: "Calendar",
    name: "March Daian",
    viewCount: "300 views",
    period: "three months ago",
  );
  Items item8 = new Items(
    img: ("images/koompi_icon.png"),
    title: "Calendar",
    name: "March Daian",
    viewCount: "300 views",
    period: "three months ago",
  );
  Items item9 = new Items(
    img: ("images/koompi_icon.png"),
    title: "Calendar",
    name: "March Daian",
    viewCount: "300 views",
    period: "three months ago",
  );
  Items item10 = new Items(
    img: ("images/koompi_icon.png"),
    title: "Calendar",
    name: "March Daian",
    viewCount: "300 views",
    period: "three months ago",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> mylist = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8,
      item9,
      item10
    ];
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          child: GridView.count(
            childAspectRatio: 1.0,
            padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: mylist.map((data) {
              return Container(
                decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
