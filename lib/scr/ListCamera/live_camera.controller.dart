import 'package:cloudcam/api/camera_api.dart';
import 'package:cloudcam/model/camera_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppState { LOADING, ERROR, DONE, UPDATING }

class LiveCameraController extends GetxController with WidgetsBindingObserver {
  var fullCamera = [].obs;
  var listCamera = [].obs;
  var numberOfRow = 2;
  String query = '';
  var status = AppState.LOADING.obs;
  var mapListStatus = Map<String, dynamic>().obs;
  @override
  void onInit() async {
    super.onInit();
    await getListCamera();
    await getstatus();
  }

  Future<void> getListCamera() async {
    final response = await CameraApi.share.GetListCamera();
    try {
      if (response.statusCode == 200) {
        var data = response.data["camera_list"];
        print(data);
        var datadefault = ListCamera.fromJson(data);
        print(datadefault);
        var listCam =
            datadefault.listcamera.map((e) => Camera.fromJson(e.toJson()));
        print(listCam);
        fullCamera.addAll(listCam);
        listCamera.addAll(listCam);
        status.value = AppState.DONE;
      }
    } catch (e) {
      status.value = AppState.ERROR;
    }
  }

  Future<void> getstatus() async {
    List<String> arrCode = [];
    for (var item in fullCamera) {
      arrCode.add(item.cameraCode);
    }
    final response = await CameraApi.share.getStatus(arrCode);
    mapListStatus.addAll(response.data['status']);
  }

  bool checkStatusCam(String code) {
    var status = mapListStatus[code];
    if (status == "READY") {
      return true;
    }
    return false;
  }

  Future<void> updateQuery(String query) async {
    this.query = query;
  }

  Future<void> updateListCamera(List<dynamic> list) async {
    listCamera.clear();
    if (query == '') {
      listCamera.addAll(fullCamera);
    } else {
      listCamera.addAll(list);
    }
  }

  // Future<List<Camera>> getlistCamera() async {
  //   final dio = Dio();

  //   dio.options.headers['content-Type'] = 'application/json';
  //   try {
  //     String token = await _share.getTokenSharePreference() ?? "";
  //     Response response = await dio.get(
  //         "https://sentirlite.com" + '/api/v1/camera/list',
  //         options: Options(headers: {"X-Tokens": token}));
  //     if (response.statusCode == 200) {
  //       var data = response.data["camera_list"];

  //       var datadefault = ListCamera.fromJson(data) as ListCamera;
  //       print(data);
  //       List<Camera> listcamera = datadefault.listcamera
  //           .map((e) => Camera.fromJson(e.toJson()))
  //           .toList();
  //       setState(() {
  //         listCamera = listcamera;
  //         fullCamera = listcamera;
  //       });
  //       return listCamera;
  //     }
  //     return [];
  //     // print('User created: ${response.data}');
  //   } catch (e) {
  //     print('Error creating user: ${e.toString()}');
  //     // showDialog(
  //     //     context: context,
  //     //     builder: (context) => AlertDialog(
  //     //           content: Text("Error"),
  //     //         ));
  //     return [];
  //   }
  // }
}
