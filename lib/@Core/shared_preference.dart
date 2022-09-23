import 'package:shared_preferences/shared_preferences.dart';

class AppSharePreference {
  static AppSharePreference share = AppSharePreference();
  //=======================
  var _userDict = "UserDict";
  Future<bool> setUserDictSharePreference(List<String> token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(_tokenLogin, token);
  }

  Future<List<String>?> getUserDictSharePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_userDict);
  }

  //=======================
  var _isLogin = "islogin";
  Future<bool> setIsLoginSharePreference(bool islogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(_isLogin, islogin);
  }

  Future<bool> getIsLoginSharePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLogin) ?? false;
  }

  //=======================
  var _tokenLogin = "Xtoken";
  Future<bool> setTokenSharePreference(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_tokenLogin, token);
  }

  Future<String?> getTokenSharePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenLogin);
  }
}
