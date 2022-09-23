import 'package:cloudcam/@Core/shared_preference.dart';
import 'package:cloudcam/scr/Camera/camera.dart';
import 'package:cloudcam/scr/ListCamera/live_camera.dart';
import 'package:cloudcam/scr/Settings/settings.dart';
import 'package:cloudcam/scr/Storage/storage.dart';
import 'package:cloudcam/scr/login/login.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    LiveCameraScreen(),
    StorageScreen(),
    CameraScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 20,
          selectedIconTheme: const IconThemeData(size: 30),
          selectedLabelStyle: const TextStyle(fontSize: 10, color: Colors.blue),
          selectedItemColor: Colors.blue,
          unselectedLabelStyle:
              const TextStyle(fontSize: 10, color: Colors.grey),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              label: "List",
              icon: Icon(Icons.play_circle_filled),
            ),
            BottomNavigationBarItem(
              label: "Storage",
              icon: Icon(
                Icons.storage,
              ),
            ),
            BottomNavigationBarItem(
              label: "Camera",
              icon: Icon(
                Icons.video_call,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Settings",
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        // body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
