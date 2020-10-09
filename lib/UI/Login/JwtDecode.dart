import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Dashboard/maindashboardScreen/dashboardScreen.dart';
import 'package:koompi_academy_project/UI/Home/homedisplay.dart';

class JwtDecode{
  static Map<String, dynamic> tryParseJwt(String token,BuildContext context) {
   if (token == null) return null;
   final parts = token.split('.');
   if (parts.length != 3) {
     return null;
   }
   final payload = parts[1];
   var normalized = base64Url.normalize(payload);
   var resp = utf8.decode(base64Url.decode(normalized));
   final payloadMap = json.decode(resp);
   String test = payloadMap['role'];
   print(test);
   if (payloadMap is! Map<String, dynamic>) {
     return null;
   }
  //  print(payloadMap);
   if(test == "teacher"){
     Navigator.push(context, MaterialPageRoute(builder: (_) => MainDashboard()));
   }else{
     Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
   }
  //  return payloadMap;
 }
}