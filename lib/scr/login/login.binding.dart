import 'package:cloudcam/scr/login/login.controller.dart';
import 'package:cloudcam/scr/login/login.dart';
import 'package:get/instance_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
