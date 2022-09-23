import 'package:cloudcam/scr/Camera/camra.controller.dart';
import 'package:cloudcam/scr/ListCamera/live_camera.controller.dart';
import 'package:get/instance_manager.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveCameraController());
    Get.lazyPut(() => CameraController());
    // Get.lazyPut(() => storageco());
  }
}
