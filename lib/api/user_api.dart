import 'dart:convert';

import 'package:cloudcam/@Core/constants.dart';
import 'package:cloudcam/@Core/shared_preference.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class UserApi {
  static UserApi share = UserApi();
  Future<Response?> login(String username, String password) async {
    final dio = Dio();
    print(username);
    print(password);
    dio.options.headers['content-Type'] = 'application/json';
    var params = {
      "email": username,
      "password": password,
    };
    try {
      final response = await dio.post(
          AppConstants.shared.baseUrl + AppConstants.shared.domainLogin,
          options: Options(
              headers: {"Content-Type": "application/x-www-form-urlencoded"}),
          data: params);
      await AppSharePreference.share.setIsLoginSharePreference(true);
      await AppSharePreference.share
          .setTokenSharePreference(response.data['session_key']);
      print(response);
      return response;
    } catch (e) {
      return null;
    }
  }
}
