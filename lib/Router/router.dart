import 'package:cloudcam/MainScreen/main_screen.binding.dart';
import 'package:cloudcam/Router/pages.dart';
import 'package:cloudcam/MainScreen/main_screen.dart';
import 'package:cloudcam/scr/Camera/camera.binding.dart';
import 'package:cloudcam/scr/Camera/camera.dart';
import 'package:cloudcam/scr/ListCamera/live_camera.binding.dart';
import 'package:cloudcam/scr/ListCamera/live_camera.dart';
import 'package:cloudcam/scr/login/login.binding.dart';
import 'package:cloudcam/scr/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

GetPage _init(String router, Widget Function() func, Bindings? bindings) =>
    GetPage(name: router, page: func, binding: bindings);

class Routers {
  static final route = [
    _init(ROUTER_LOGINSCREEN, () => LoginScreen(), LoginBinding()),
    _init(ROUTER_MAINSCREEN, () => MainScreen(), MainScreenBinding()),
    _init(ROUTER_CAMERA, () => CameraScreen(), CameraBinding()),
    _init(ROUTER_LIVECAMERA, () => LiveCameraScreen(), LiveCameraBinding())
  ];
}
