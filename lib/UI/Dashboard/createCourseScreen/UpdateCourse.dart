import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:koompi_academy_project/API%20Server/graphQLConf.dart';
import 'package:koompi_academy_project/API%20Server/graphqlQuery/dashboardQuery.dart';
import 'package:koompi_academy_project/API%20Server/grapqlMutation/mutation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UpdateCourse extends StatefulWidget {
  final String id;
  final String org_id;
  final String title;
  final int price;
  final String pravcy;
  final List category;
  final Future<File> thumbnail;
  final String description;
  final String course_id;
  final Function onClickUpdate;
  final int index;

  const UpdateCourse({
    Key key,
    this.id,
    this.org_id,
    this.title,
    this.price,
    this.pravcy,
    this.category,
    this.thumbnail,
    this.description,
    this.course_id,
    this.index,
    this.onClickUpdate,
  }) : super(key: key);

  @override
  _UpdateCourseState createState() => _UpdateCourseState();
}

class _UpdateCourseState extends State<UpdateCourse> {
  List<Map<String, dynamic>> _myJsons = [];
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
  String _statusName = "Public";
  String _categoryName;

  Widget sizeHight() {
    return SizedBox(height: 8.0);
  }

  final _courseTitleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fillList();
    _courseTitleController.text = widget.title;
    _descriptionController.text = widget.description;
    _categoryName = widget.category[0];
  }

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
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
          labelText: "Course Description",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        maxLength: 600,
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
        textColor: Colors.white);
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
        border: Border.all(width: 1, color: Colors.grey),
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
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                      // }).toList(),
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
                      items: _myJsons.map((Map map) {
                        return DropdownMenuItem<String>(
                          value: map['title'],
                          child: Text(map['title']),
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
      print(_image);
    });
    print("File Path ${_image}");
    // decodeFile(_image);
  }

  Future<String> decodeFile(File _images) async {
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
            child: _image != null
                ? Container(
                    height: 130.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(_image),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          width: 170.0,
                          height: 50.0,
                          child: new RaisedButton(
                            color: Color(0xFF5dabff),
                            onPressed: () async {
                              if (_courseTitleController.text.isNotEmpty &&
                                  _statusName.isNotEmpty &&
                                  _categoryName.isNotEmpty &&
                                  _descriptionController.text.isNotEmpty) {
                                GraphQLClient _client =
                                    graphQLConfiguration.clientToQuery();
                                QueryResult result = await _client.mutate(
                                  MutationOptions(
                                    update: (Cache cache, QueryResult result) {
                                      if (!result.hasException) {
                                        _courseTitleController.clear();
                                        _statusName = null;
                                        _categoryName = null;
                                        _descriptionController.clear();
                                        loginToastFail(result
                                            .data['update_course']['message']);
                                        Navigator.pop(context);
                                      } else {
                                        loginToastFail("Update Error!!!");
                                      }
                                      return result;
                                    },
                                    documentNode: gql(addMutation.updateCourse(
                                      widget.id,
                                      _courseTitleController.text,
                                      _statusName,
                                      0,
                                      _categoryName,
                                      imageUrl,
                                      _descriptionController.text,
                                      widget.org_id,
                                    )),
                                  ),
                                );
                              } else {
                                return loginToastFail("Please fill form!");
                              }
                            },
                            child: new Text(
                              "Update Course",
                              style:
                                  TextStyle(fontSize: 15.0, color: Colors.white),
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
