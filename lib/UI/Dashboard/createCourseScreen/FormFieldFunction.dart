import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
  //*****************Course Title Field Form*****************/
  Widget courseTitleField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.115,
      child: new TextFormField(
        // controller: _productName,
        decoration: new InputDecoration(
          labelText: "Course Title",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
      ),
    );
  }
  
   //*****************Tage Mode Field Form****************/
  Widget tageModeField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.115,
      child: new TextFormField(
        // controller: _productName,
        decoration: new InputDecoration(
          labelText: "Tage Mode",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
      ),
    );
  }
  
   //**************Course Description Field Form*************/
  Widget courseDescription(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.115,
      child: new TextFormField(
        // controller: _productName,
        decoration: new InputDecoration(
          labelText: "Enter Product Name",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        maxLength: 400,
        maxLines: 5,
      ),
    );
  }
  
   //*****************Course Price Form*************/
  Widget coursePrice(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2.5,
        child: NumberInputWithIncrementDecrement(
          controller: TextEditingController(),
          widgetContainerDecoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
          ),
          onIncrement: (num newlyIncrementedValue) {
            print('Newly incremented value is $newlyIncrementedValue');
          },
          onDecrement: (num newlyDecrementedValue) {
            print('Newly decremented value is $newlyDecrementedValue');
          },
        ));
  }
   
   //********Display Image Static and from Gellery************/
  Widget ImageEmpty(){
    return Container(
      height: 120.0,
      width: 190.0,
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("images/coursenotfound.gif"),
          )
        ),
      );
  }
  
  //***************Select Image From Gellery Fuction**************/
  Future<File> imageFile;
  pickImageFromGallery(ImageSource source) async{
    imageFile = ImagePicker.pickImage(
        source: ImageSource.gallery
        );
    // setState(() {
    //    imageFile = imageFile;
    // });
  }

  //****************Show ImageFuntion*************** */
  Widget ShowImage(){
    return FutureBuilder(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot){
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
              print(snapshot.data.toString());
          return Image.file(
            snapshot.data,
            width: 120,
            height: 120,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        }else {
          return(
            ImageEmpty()
          );
        }
      }
    );
  }
