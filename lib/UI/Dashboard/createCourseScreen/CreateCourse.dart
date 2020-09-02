import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'FormFieldFunction.dart';

class CreateCourse extends StatefulWidget {
  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {

    var _currencies = [
    "science",
    "engineering",
    "technology",
    "mathermatic",
    "moeys-cambodia",
    "art",
    "chroy-chongva-school",
    "hina",
    "camboida-accounting-club",
    "វិទ្យាល័យហ៊ុនសែនសេរីភាព",
    "សាលាបឋមសិក្សាវត្តបូព៍",
    "new-generation-school"
  ];
  var _currenstatus = [
    "Private",
    "Public",
  ];
  String _statusName;
  String _categoryName;
  Widget sizeHight() {
    return SizedBox(height: 8.0);
  }
  Widget selectStatusCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 4,
            child: FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      labelText: "Select Status",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _statusName,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          _statusName = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: _currenstatus.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            )),
        Container(
            width: MediaQuery.of(context).size.width / 1.7,
            child: FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      labelText: "Choose Category",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _categoryName,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          _categoryName = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,top: 30),
            child: GestureDetector(
              onTap: (){
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
          SizedBox(height: 20.0),
          // ImageEmpty(),
          ShowImage(),
          RaisedButton(
            onPressed: () {
              pickImageFromGallery(ImageSource.gallery);
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF5dabff),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text('Select Image'),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    courseTitleField(context),
                    sizeHight(),
                    tageModeField(context),
                    sizeHight(),
                    SizedBox(height: 8.0),
                    selectStatusCategory(),
                    sizeHight(),
                    courseDescription(context),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          coursePrice(context),
                          Container(
                            width: 170.0,
                            height: 50.0,
                            child: new RaisedButton(
                              color: Color(0xFF5dabff),
                              onPressed: () => print("Button Pressed"),
                              child: new Text(
                                "Create Course",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
