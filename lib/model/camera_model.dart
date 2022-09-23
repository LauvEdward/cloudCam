import 'dart:convert';

class ListCamera {
  ListCamera({required this.listcamera});
  List<Camera> listcamera;
  factory ListCamera.fromJson(Map<String, dynamic> json) {
    final datalistcam = json['DEFAULT'] as List<dynamic>?;
    final listobjectCam = datalistcam != null
        ? datalistcam.map((e) => Camera.fromJson(e)).toList()
        : <Camera>[];
    return ListCamera(listcamera: listobjectCam);
  }
}

class Camera {
  Camera(
      {required this.id,
      required this.groupID,
      required this.cameraCode,
      required this.cameraName,
      required this.cameraSerial,
      required this.cameraMode,
      required this.status,
      required this.createdGroup,
      required this.createdUser});
  String id;

  String groupID;

  String cameraCode;

  String cameraName;

  String cameraSerial;

  String cameraMode;

  String status;

  String createdGroup;

  String createdUser;

  factory Camera.fromJson(Map<String, dynamic> json) {
    final tid = json['id'] as String;
    final tgroupID = json['group_id'] as String;
    final tcameraCode = json['camera_code'] as String;
    final tcameraName = json['camera_name'] as String;
    final tcameraSerial = json['camera_serial'] as String;
    final tcameraMode = json['camera_mode'] as String;
    final tstatus = json['status'] as String;
    final tcreatedGroup = json['created_group'] as String;
    final tcreatedUser = json['created_user'] as String;
    return Camera(
      id: tid,
      groupID: tgroupID,
      cameraCode: tcameraCode,
      cameraName: tcameraName,
      cameraSerial: tcameraSerial,
      cameraMode: tcameraMode,
      status: tstatus,
      createdGroup: tcreatedGroup,
      createdUser: tcreatedUser,
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'group_id': groupID,
        'camera_code': cameraCode,
        'camera_name': cameraName,
        'camera_serial': cameraSerial,
        'camera_mode': cameraMode,
        'status': status,
        'created_group': createdGroup,
        'created_user': createdUser,
      };
  // int.parse((item["id"])),
  //           int.parse(item["group_id"]),
  //           item["camera_code"] ?? "",
  //           item["camera_name"] ?? "",
  //           item["camera_serial"] ?? "",
  //           item["camera_mode"] ?? "",
  //           int.parse(item["status"]),
  //           int.parse(item["created_group"]),
  //           int.parse(item["created_user"]));
  // factory Camera.fromMap(Map<String, dynamic> json) => Camera(json["id"], json["group_id"], json["camera_code"], json["camera_name"], json["camera_mode"], json["camera_mode"], json["status"], json["created_group"], json["created_user"]);
}
