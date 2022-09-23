import 'dart:convert';

import 'package:cloudcam/@Core/constants.dart';
import 'package:cloudcam/@Core/shared_preference.dart';
import 'package:dio/dio.dart';

class CameraApi {
  static CameraApi share = CameraApi();
  Future<Response> GetListCamera() async {
    final dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    String token =
        await AppSharePreference.share.getTokenSharePreference() ?? "";
    print(token);
    final response = await dio.get(
        AppConstants.shared.baseUrl + AppConstants.shared.domainListcam,
        options: Options(headers: {"X-Tokens": token}));
    print(response.statusCode);
    return response;
  }

  Future<Response> getStatus(List<String> arr) async {
    print(arr);
    final dio = Dio();
    String token =
        await AppSharePreference.share.getTokenSharePreference() ?? "";
    var body = jsonEncode(arr);
    final reponse = await dio.post(
        AppConstants.shared.baseUrl + AppConstants.shared.domainCheckStatus,
        options: Options(
          headers: {
            "X-Tokens": token,
            "Content-Type": "application/x-www-form-urlencoded"
          },
        ),
        data: body);
    print(reponse.statusCode);
    return reponse;
  }
}
