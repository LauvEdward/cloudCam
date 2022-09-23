import 'package:cloudcam/scr/Camera/camera.dart';
import 'package:cloudcam/scr/ListCamera/live_camera.controller.dart';
import 'package:get/instance_manager.dart';

class CameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveCameraController());
  }
}
