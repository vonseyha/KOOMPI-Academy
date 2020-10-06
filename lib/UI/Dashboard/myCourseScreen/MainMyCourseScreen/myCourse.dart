import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Home/property.dart';
import 'CardViewMyCourse.dart';

class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  TextEditingController editingSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      child: Image.asset("images/backone.png"),
                    ),
                  ),
                  Container(
                    child: Text("Back"),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Here Your Course!",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Container(
                child: TextField(
                    controller: editingSearchController,
                    // focusNode: focusNode,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color(0x4437474F),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "Search here...",
                      contentPadding: const EdgeInsets.only(
                        left: 16,
                        right: 20,
                        top: 14,
                        bottom: 14,
                      ),
                    ),
                  ),
                ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardViewMyCourse(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
