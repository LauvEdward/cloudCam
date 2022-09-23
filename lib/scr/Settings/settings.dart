import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [thankfromBHD()],
        ),
      ),
    );
  }

  Widget thankfromBHD() {
    return Container(
      height: 100,
      child: Row(
        children: [
          Image(image: AssetImage('assets/images/logo.png')),
          Text("Thanks for using BHD Cloucam")
        ],
      ),
    );
  }
}
