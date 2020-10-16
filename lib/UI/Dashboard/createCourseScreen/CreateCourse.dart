import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/api.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/mutation.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class CreateCourse extends StatefulWidget {
  final String owner_id;
  const CreateCourse({
    Key key,
    this.owner_id
    // this.refetchCourse
    }) : super(key: key);

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
  ];

  var _currenstatus = [
    "Public",
  ];

  final _formKey = GlobalKey<FormState>();
  String _statusName;
  String _categoryName;
  int price;
  String imagefile;
  Widget sizeHight() {
    return SizedBox(height: 8.0);
  }

  final _courseTitleController = TextEditingController();
  final _tageModeController = TextEditingController();
  final _statusController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();

  String coursetitle;
  String tagemode;
  String category;
  String status;
  String description;

  String typenameDataIdFromObject(Object object) {
    if (object is Map<String, Object> &&
        object.containsKey('__typename') &&
        object.containsKey('id')) {
      return "${object['__typename']}/${object['id']}";
    }
    return null;
  }

  //*****************Course Title Field Form*****************/
  courseTitleField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.05,
      child: new TextFormField(
        controller: _courseTitleController,
        decoration: new InputDecoration(
          labelText: "Course Title",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        onSaved: (val) => coursetitle = val,
      ),
    );
  }
//**************Course Description Field Form*************/
  courseDescription(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.05,
      child: new TextFormField(
        controller: _descriptionController,
        decoration: new InputDecoration(
          labelText: "Course Description",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
        ),
        maxLength: 300,
        maxLines: 3,
        onSaved: (val) => description = val,
      ),
    );
  }

//*****************Course Price Form*************/
  coursePrice(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: NumberInputWithIncrementDecrement(
        controller: TextEditingController(),
        widgetContainerDecoration: BoxDecoration(
          border: null,
        ),
        onIncrement: (num newlyIncrementedValue) {
          print('Newly incremented value is $newlyIncrementedValue');
          setState(() {
            price = newlyIncrementedValue.toInt();
          });
        },
        onDecrement: (num newlyDecrementedValue) {
          print('Newly decremented value is $newlyDecrementedValue');
        },
        onSubmitted: (newValue) => price = newValue,
      ),
    );
  }

  loginToastFail(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white
    );
  }

//********Display Image Static and from Gellery************/
  Widget ImageEmpty() {
    return Container(
      height: 130.0,
      width: 130.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/empty.png"),
          ),
          border: Border.all(width:1,color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
     ),
    );
  }

  Widget selectStatusCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            // width: MediaQuery.of(context).size.width / 3.5,
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
        SizedBox(width: 5),

        Expanded(
            flex: 4,
            // width: MediaQuery.of(context).size.width / 1.6,
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
        // ),
      ],
    );
  }
  //***************Select Image From Gellery Fuction**************/
  File _image;
  String imageUrl;
  Future selectImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  setState(() {
    _image = image;
    print(_image );
  });
  print("File Path ${_image}");
  // decodeFile(_image);
}

  Future<String>  decodeFile(File _images)async{
    print("File Path ${_images}");
      List<int> compressImage = await FlutterImageCompress.compressWithFile(
      _images.path,
      minHeight: 1300,
      minWidth: 1000,
      quality: 100,
    );
    var multipartFile = new http.MultipartFile.fromBytes(
      'file',
      compressImage,
      filename: 'image_picker.jpg',
      contentType: MediaType.parse('image/jpeg'),
    );
    /* Make request */
     var request = new http.MultipartRequest(
        'POST', Uri.parse('https://learnbackend.koompi.com/uploads'));
        request.files.add(multipartFile);
        /* Start send to server */
        http.StreamedResponse response = await request.send();
        /* Getting response */
        response.stream.transform(utf8.decoder).listen((data) {
          print("----------------------------Image url $data");
          setState(() {
            imageUrl = data;
          });
        });
        return imageUrl;
  }


  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation addMutation = QueryMutation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          SizedBox(height: 15.0),
          Container(
            child: _image != null ?
                   Container(
                    height: 130.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(_image),
                          fit: BoxFit.cover,
                      ),
                      border: Border.all(width: 1 ,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                  ),  )
                   : ImageEmpty(),
          ),
          RaisedButton(
            onPressed: () {
              selectImage();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    courseTitleField(context),
                    sizeHight(),
                    SizedBox(height: 8.0),
                    selectStatusCategory(),
                    sizeHight(),
                    courseDescription(context),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Course Price(\$)",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          coursePrice(context),
                          Container(
                            width: 170.0,
                            height: 50.0,
                            child: new RaisedButton(
                              color: Color(0xFF5dabff),
                              onPressed: () async {
                                decodeFile(_image);
                                if (_courseTitleController.text.isNotEmpty &&
                                    price.toString().isNotEmpty &&
                                    _statusName.isNotEmpty &&
                                    _categoryName.isNotEmpty &&
                                    _descriptionController.text.isNotEmpty) {
                                    GraphQLClient _client = graphQLConfiguration.clientToQuery();
                                    QueryResult result = await _client.mutate(
                                      MutationOptions(
                                        update: (Cache cache, QueryResult result) {
                                            if (!result.hasException) {
                                              _courseTitleController.clear();
                                              _tageModeController.clear();
                                              price = 0;
                                              _statusName = null;
                                              _categoryName = null;
                                              imagefile = null;
                                              _descriptionController.clear();
                                              loginToastFail(result.data['create_course']['message']);
                                              Navigator.pop(context);
                                            } else {
                                              loginToastFail("Create Error!!!");
                                            }
                                            return result;
                                          },
                                        documentNode: gql(addMutation.addCourse(
                                          "5f432977da0863337654d38c",
                                          _courseTitleController.text,
                                          _statusName,
                                          price,
                                          _categoryName,
                                          imageUrl,
                                          _descriptionController.text,
                                          widget.owner_id,
                                        )),
                                      ),
                                    );
                                }else {
                                   return loginToastFail("Please fill form!");
                                }
                              },
                              child: new Text(
                                "Create Course",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white
                                ),
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
