import 'package:shared_preferences/shared_preferences.dart';

class SharePrefer{
  static Future<String> isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    return token;
  }
    static Future<String> readRole() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String role = sharedPreferences.getString('role');
    return role;
  }
    static Future<String> readLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String option = sharedPreferences.getString('seen');
    return option;
  }
}