import 'package:cloudcam/scr/ListCamera/live_camera.controller.dart';
import 'package:get/instance_manager.dart';

class LiveCameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveCameraController());
  }
}
