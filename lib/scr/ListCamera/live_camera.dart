import 'package:cloudcam/@Core/shared_preference.dart';
import 'package:cloudcam/model/camera_model.dart';
import 'package:cloudcam/scr/ListCamera/live_camera.controller.dart';
import 'package:cloudcam/scr/login/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LiveCameraScreen extends GetView<LiveCameraController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Obx(() {
      if (controller.status == AppState.ERROR) {
        return AlertDialog(
          content: Text("API ERROR"),
        );
      } else if (controller.status != AppState.LOADING) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 40,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Image(image: AssetImage('assets/images/logo.png')),
                  Text(
                    'LIST CAMERA',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "PHUC LE",
                    style: TextStyle(
                        color: Colors.blue[900], fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            // buildSearch(),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.listCamera.length,
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  // Generate 100 widgets that display their index in the List.
                  itemBuilder: (content, index) {
                    return Center(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                              height: 30,
                              child: Center(
                                child: Text(
                                    "${(controller.listCamera)[index].cameraName}"),
                              )),
                        ],
                      ),
                    ));
                  },
                ),
              ),
            ),
          ],
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    }));
  }

  // Widget buildSearch() => Obx(
  //       () => SearchWidget(
  //         text: controller.query,
  //         hintText: 'SEARCH CAMERA',
  //         onChanged: searchBook,
  //       ),
  //     );
  // Future<void> searchBook(String query) async {
  //   final came = controller.listCamera.where((came) {
  //     final namecame = came.cameraName.toLowerCase();
  //     final searchLower = query.toLowerCase();
  //     return namecame.contains(searchLower);
  //   }).toList();
  //   await controller.updateQuery(query);
  //   await controller.updateListCamera(came);
  // }
}

// class SearchWidget extends StatefulWidget {
//   final String text;
//   final ValueChanged<String> onChanged;
//   final String hintText;

//   const SearchWidget({
//     Key? key,
//     required this.text,
//     required this.onChanged,
//     required this.hintText,
//   }) : super(key: key);

//   @override
//   _SearchWidgetState createState() => _SearchWidgetState();
// }

// class _SearchWidgetState extends State<SearchWidget> {
//   final controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final styleActive = TextStyle(color: Colors.black);
//     final styleHint = TextStyle(color: Colors.black54);
//     final style = widget.text.isEmpty ? styleHint : styleActive;

//     return Container(
//       height: 40,
//       margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         border: Border.all(color: Colors.black26),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           icon: Icon(Icons.search, color: styleActive.color),
//           suffixIcon: widget.text.isNotEmpty
//               ? GestureDetector(
//                   child: Icon(Icons.close, color: styleActive.color),
//                   onTap: () {
//                     controller.clear();
//                     widget.onChanged('');
//                     FocusScope.of(context).requestFocus(FocusNode());
//                   },
//                 )
//               : null,
//           hintText: widget.hintText,
//           hintStyle: style,
//           border: InputBorder.none,
//         ),
//         style: style,
//         onChanged: widget.onChanged,
//       ),
//     );
//   }
// }
