import 'dart:convert';
import 'package:cloudcam/@Core/constants.dart';
import 'package:cloudcam/@Core/shared_preference.dart';
import 'package:cloudcam/MainScreen/main_screen.dart';
import 'package:cloudcam/Router/pages.dart';
import 'package:cloudcam/model/user_model.dart';
import 'package:cloudcam/scr/login/login.controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.grey[50]!,
                      Colors.grey[100]!,
                      Colors.grey[200]!
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 100,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'BHD CloudCam',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      buildEmail(),
                      SizedBox(
                        height: 20,
                      ),
                      buildPassword(),
                      SizedBox(
                        height: 20,
                      ),
                      buildRememberCB(),
                      SizedBox(
                        height: 20,
                      ),
                      buildLoginBtn(context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
              color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            onChanged: (value) => {controller.username = value},
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
              color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            onChanged: (value) => {controller.password = value},
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.blue,
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildRememberCB() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.blue),
              child: Container(
                child: Checkbox(
                  value: controller.isRemember,
                  checkColor: Colors.green,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    controller.isRemember = value ?? false;
                    // setState(() {
                    //   isRememberme = value!;
                    // });
                  },
                ),
              )),
          Text(
            'Remember me',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: Container(
        child: RaisedButton(
          padding: EdgeInsets.all(15),
          color: Colors.white,
          elevation: 5,
          child: Text(
            'LOGIN',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          onPressed: () => {
            if (controller.login() == false)
              {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Text("Mật khẩu hoặc tên đăng nhập sai"),
                        ))
              }
            else
              {controller.pushScreen()}
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
  // Future<bool> getUser() async {
  //   // Perform GET request to the endpoint "/users/<id>"
  //   final dio = DioClient.share._dio;
  //   dio.options.headers['content-Type'] = 'application/json';
  //   var params = {
  //     "email": "ttkdvnptdng@gmail.com",
  //     "password": "vnpt@2021#",
  //   };
  //   try {
  //     Response response = await dio.post(
  //         AppConstants.shared.baseUrl + '/api/v1/login',
  //         options: Options(
  //             headers: {"Content-Type": "application/x-www-form-urlencoded"}),
  //         data: jsonEncode(params));
  //     if (response.statusCode == 200) {
  //       // _share.setUserDictSharePreference([re])
  //       var userdata = response.data['user'];
  //       print('userdata: ${response.data}');
  //       var userInfor = User.fromJson(userdata);
  //       print('userInfor: ${userInfor}');
  //       await _share.setIsLoginSharePreference(true);
  //       await _share.setTokenSharePreference(response.data['session_key']);

  //     }
  //     if (response.statusCode == 200) {}
  //     return response.statusCode == 200 ? true : false;
  //   } catch (e) {
  //     showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //               content: Text("Login Fail"),
  //             ));
  //     return false;
  //   }
  // }
}
