import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:koompi_academy_project/UI/Dashboard/maindashboardScreen/dashboardScreen.dart';
import 'package:koompi_academy_project/UI/Home/homedisplay.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
   String owner_id = payloadMap['id'];
   print(test);
   print(owner_id);
   if (payloadMap is! Map<String, dynamic>) {
     return null;
   }
   print("================${payloadMap}");
   
   if(test == "teacher"){
     Navigator.push(context, MaterialPageRoute(builder: (_) => MainDashboard(owner_id:owner_id )));
   }else{
     Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage(checkAppbar: "login")));
   }
  //  return payloadMap;
 }
}