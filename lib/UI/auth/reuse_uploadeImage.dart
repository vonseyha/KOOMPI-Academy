import 'dart:convert';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:koompi_academy_project/UI/Dashboard/createCourseScreen/getProperty.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class ReuseUploadeImage {
  static  decodeFile(File _images , String imageUrl )async{
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
          imageUrl =  "http://192.168.1.145:6001/public/uploads/${mWelcome.fileName}";
          print(imageUrl);
        });
        return imageUrl;
  }

}

