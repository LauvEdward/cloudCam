import 'package:cloudcam/@Core/shared_preference.dart';
import 'package:cloudcam/scr/Camera/camra.controller.dart';
import 'package:cloudcam/scr/ListCamera/live_camera.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CameraScreen extends GetView<LiveCameraController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: [addCamera(context), Expanded(child: listCamera())],
    ));
  }

  Widget addCamera(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Add camera',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          color: Colors.black,
          onPressed: () => {_displayDialog(context)},
        ),
      ],
    );
  }

  Widget listCamera() {
    return Obx(
      () => ListView.builder(
          itemCount: controller.fullCamera.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.fullCamera[index].cameraName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            backgroundColor: controller.checkStatusCam(
                                    controller.fullCamera[index].cameraCode)
                                ? Colors.green
                                : Colors.red,
                            radius: 5,
                          ),
                        )
                        // dot(controller.mapListStatus[
                        //         controller.fullCamera[index].cameraCode] ==
                        //     "READY")
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget dot(bool isAc) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: CircleAvatar(
        backgroundColor: isAc ? Colors.green : Colors.red,
        radius: 5,
      ),
    );
  }

  Future<void> getListNameCamera() async {
    var _share = AppSharePreference();
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('What is your Lucky Number'),
            content: TextField(
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Enter your number"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  // Widget listNameCam() {
  //   return
  // }
}
