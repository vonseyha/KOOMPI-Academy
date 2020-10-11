import 'dart:io';
import 'package:flutter/material.dart';
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
import 'package:http_parser/http_parser.dart';

class CreateCourse extends StatefulWidget {

  //final Function refetchCourse;
  // CreateCourse({
  //   this.refetchCourse
  // });
 
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

//*****************Tage Mode Field Form****************/
  tageModeField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.05,
      child: new TextFormField(
        controller: _tageModeController,
        decoration: new InputDecoration(
          labelText: "Tage Mode",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        onSaved: (val) => tagemode = val,
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
          //fillColor: Colors.green
        ),
        maxLength: 400,
        maxLines: 5,
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
          // loginToastFail("Course price");
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
      height: 150.0,
      width: 150.0,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/empty.png"),
      )),
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
  Future<File> imageFile;
  pickImageFromGallery(ImageSource source) async {
    imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = imageFile;
    });
  }

void _uploadFile(filePath) async{
    //Get base file name
    String fileName = basename(filePath.path);
     print("File base name: $fileName");
}
  //****************Show ImageFuntion*************** */
  Widget ShowImage() {
    return FutureBuilder(
        future: imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            print("Image is name:" + snapshot.data.toString());
            imagefile = snapshot.data.toString();
            return Image.file(
              snapshot.data,
              height: 150.0,
              width: 150.0,
            );
          } else if (snapshot.error != null) {
            return const Text(
              'Error Picking Image',
              textAlign: TextAlign.center,
            );
          } else {
            return (ImageEmpty());
          }
        });
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
          SizedBox(height: 5.0),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                // widget.refetchCourse();
                                if (_courseTitleController.text.isNotEmpty &&
                                    _tageModeController.text.isNotEmpty &&
                                    price.toString().isNotEmpty &&
                                    _statusName.isNotEmpty &&
                                    _categoryName.isNotEmpty &&
                                    imagefile.isNotEmpty &&
                                    _descriptionController.text.isNotEmpty) {
                                    GraphQLClient _client = graphQLConfiguration.clientToQuery();
                                    QueryResult result = await _client.mutate(
                                      MutationOptions(
                                        onCompleted: (data){
                                          print(data);
                                          // widget.refetchCourse();
                                        },
                                        documentNode: gql(addMutation.addCourse(
                                          "5f432977da0863337654d38c",
                                          _courseTitleController.text,
                                          _statusName,
                                          price,
                                          _categoryName,
                                          imagefile,
                                          _descriptionController.text,
                                          "5d5238fdb478d918d8b8af18",
                                        )),
                                      ),
                                    );
                                    if (!result.hasException) {
                                        _courseTitleController.clear();
                                        _tageModeController.clear();
                                        price = 0;
                                        _statusName = null;
                                        _categoryName = null;
                                        imagefile = null;
                                        _descriptionController.clear();
                                        // widget.refetchCourse();
                                      Navigator.of(context).pop();
                                      return Fluttertoast.showToast(
                                          msg: "Create Course  Sucessfuly!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIos: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white);
                                    } else if (result.hasException) {
                                      print("============$result.data['create_course']['message']");
                                      print("============$result.data['create_course']['status']");
                                    }
                                }else {
                                   return Fluttertoast.showToast(
                                          msg: "Please fill form!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIos: 1,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white
                                        );
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
