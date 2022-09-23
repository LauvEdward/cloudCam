import 'dart:ffi';

import 'package:cloudcam/Router/pages.dart';
import 'package:cloudcam/api/user_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with WidgetsBindingObserver {
  var username = '';
  var password = '';
  var isRemember = false;
  var _obscured = true;
  Future<bool> login() async {
    final response = await UserApi.share.login(username, password);
    print(response);
    if (response == null) {
      return false;
    }
    if ((response.statusCode ?? 0) == 200) {
      return true;
    }
    return false;
  }

  Future<void> pushScreen() async {
    return Get.toNamed(ROUTER_MAINSCREEN);
  }
}
