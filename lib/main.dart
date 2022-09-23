import 'package:cloudcam/@Core/shared_preference.dart';
import 'package:cloudcam/MainScreen/main_screen.dart';
import 'package:cloudcam/Router/pages.dart';
import 'package:cloudcam/Router/router.dart';
import 'package:cloudcam/scr/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  var isLogin = false;
  var _share = AppSharePreference();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _share.getIsLoginSharePreference().then((value) => {isLogin = value});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routers.route,
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.blue,
      ),
      initialRoute: isLogin ? ROUTER_MAINSCREEN : ROUTER_LOGINSCREEN,
    );
  }
}
