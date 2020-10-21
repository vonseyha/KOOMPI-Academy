import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/mutation.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:koompi_academy_project/UI/Dashboard/createCourseScreen/getProperty.dart';

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

  List<Map<String, dynamic>> _myJsons = [ ];

  void fillList() async {
    QueryGraphQL queryGraphQL = QueryGraphQL();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryGraphQL.getCategory()),
      ),
    );
    if (!result.hasException) {
      print(result.data["categories"].length);
        for (var i = 0; i < result.data["categories"].length; i++) {
          setState(() {
            _myJsons.add(result.data['categories'][i]);
          });
        }
    }
  }

  var _currenstatus = [
    "Public",
  ];

  final _formKey = GlobalKey<FormState>();
  String _statusName;
  String _categoryName;
  String imagefile;
  Widget sizeHight() {
    return SizedBox(height: 8.0);
  }

  final _courseTitleController = TextEditingController();
  final _descriptionController = TextEditingController();


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
        ),
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
            child: FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      errorStyle:TextStyle(color: Colors.redAccent, fontSize: 16.0),
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
                      items: _myJsons.map((Map map) {
                        return DropdownMenuItem<String>(
                          value: map['title'],
                          child: Text(
                            map['title'],
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
    decodeFile(_image);
  });

}

  Future<String>  decodeFile(File _images)async{
    String str = _images.toString();
     var arr = str.split('/');
     String imageName = arr[arr.length-1];

      List<int> compressImage = await FlutterImageCompress.compressWithFile(
      _images.path,
      minHeight: 1300,
      minWidth: 1000,
      quality: 100,
    );
    
    var multipartFile = new http.MultipartFile.fromBytes(
      'file',
      compressImage,
      filename: imageName,
      contentType: MediaType.parse('image/jpeg'),
    );
    /* Make request */
     var request = new http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.145:6001/image-upload'));
        request.files.add(multipartFile);
        /* Start send to server */
        http.StreamedResponse response = await request.send();
        /* Getting response */
        response.stream.transform(utf8.decoder).listen((data) {
          // var json = data;
          Map valueMap = json.decode(data);
          var mWelcome =  CourseImage.fromJson(valueMap);
          setState(() {
            imageUrl =  "http://192.168.1.145:6001/public/uploads/${mWelcome.fileName}";
          });
        });
        return imageUrl;
  }

 @override
  void initState() {
    fillList();
    super.initState();
  }

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation addMutation = QueryMutation();

  CourseImage welcome = CourseImage();

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
                color:  Color(0xFF4080D6)
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                              width: 170.0,
                              height: 50.0,
                              child: new RaisedButton(
                                color:  Color(0xFF4080D6),
                                onPressed: () async {
                                  if (_courseTitleController.text.isNotEmpty &&
                                      _statusName.isNotEmpty &&
                                      _categoryName.isNotEmpty &&
                                      _descriptionController.text.isNotEmpty) {
                                      GraphQLClient _client = graphQLConfiguration.clientToQuery();
                                       decodeFile(_image);
                                      QueryResult result = await _client.mutate(
                                        MutationOptions(
                                          update: (Cache cache, QueryResult result) {
                                              if (!result.hasException) {
                                                _courseTitleController.clear();
                                                _statusName = null;
                                                _categoryName = null;
                                                imagefile = null;
                                                _descriptionController.clear();
                                                print("====================${imageUrl}");
                                                loginToastFail(result.data['create_course']['message']);
                                                Navigator.pop(context);
                                              } else {
                                                loginToastFail("Create Error!!!");
                                              }
                                              return result;
                                            },
                                          documentNode: gql(addMutation.addCourse(
                                            widget.owner_id,
                                            _courseTitleController.text,
                                            _statusName,
                                            0,
                                            _categoryName,
                                            imageUrl,
                                            _descriptionController.text,
                                           "5d52486a1adfbd764bd951f8",// widget.owner_id,
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
