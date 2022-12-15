import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/storage_service.dart';
import '../theme/Themes.dart';
import '../utils/configuration.dart';

Widget header(String header) {
  return Text(header.tr,
      style: const TextStyle(
          fontSize: 22, fontWeight: FontWeight.w600, color: Colors.grey));
}

Widget title(String subtitle) {
  return Text(subtitle,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: kPrimaryColor));
}

Widget subTitle(String subtitle) {
  return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(subtitle,
          softWrap: true, style: lightTheme.textTheme.subtitle1));
}

Widget text(String text) {
  return Padding(
      padding: const EdgeInsets.only(top: 8),
      child:
          Text(text, style: TextStyle(fontSize: 16, color: Colors.grey[700])));
}

Widget limitScreen(
  Widget child,
) {
  return Center(
      child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth), child: child));
}

Widget menuButton({VoidCallback? onTap}) {
  return Positioned(
    right: 8.0,
    top: Get.height * 0.05,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
          height: 40.0,
          width: 40.0,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: const Icon(Icons.menu, color: kSecondaryColor, size: 20)),
    ),
  );
}

// Widget positionedBackButton({Color? color}) {
//   return Positioned(
//       left: 8.0,
//       top: Get.height * 0.05,
//       child: backButton(color: color ?? kPrimaryColor));
// }

// Widget backButton({Color? color}) {
//   return GestureDetector(
//     onTap: () => goBack(),
//     child: Container(
//       height: 40.0,
//       width: 40.0,
//       decoration:
//           const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//       child: Icon(
//         Icons.arrow_back,
//         color: color ?? kPrimaryColor,
//         size: 20,
//       ),
//     ),
//   );
// }

Widget backButtonColored() {
  return Container(
      height: 40.0,
      width: 40.0,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 20,
      ));
}

Widget circleButton(IconData icon) {
  return Container(
      height: 50.0,
      width: 50.0,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
      child: Icon(
        icon,
        color: Colors.white,
        size: 36,
      ));
}

Widget customListTile() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 70,
        color: Colors.grey[200],
        child: Row(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 70,
              height: 70,
              child: const Icon(Icons.cake, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text('Test Title'),
                  Text('Test Video', style: TextStyle(color: Colors.grey))
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.blue),
          ],
        ),
      ),
    ),
  );
}

ListTile simpleListTile(
    String title, String subtitle, IconData icon, Color color) {
  return ListTile(
    onTap: () {},
    //contentPadding: EdgeInsets.symmetric(vertical: 4),
    leading: Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white),
    ),
    title: Text(title.tr),
    //subtitle: Text(subtitle.tr),
    trailing: IconButton(
      icon: const Icon(Icons.chevron_right),
      onPressed: () {},
    ),
  );
}

Widget smallColoredButton(IconData icon) {
  return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Icon(
        icon, //Icons.keyboard_arrow_left,
        color: Colors.white,
        size: 28,
      ));
}

Widget noData() {
  return Center(child: Text("No data".tr));
}

Widget greyLine() {
  return Divider(
    color: Colors.grey[400],
    height: 1,
  );
}

// Widget blackButton(String caption, String route, String id) {
//   final String parsedRoute = parseString(route);

//   return Container(
//     width: 320,
//     height: 60,
//     margin: const EdgeInsets.only(top: 40, bottom: 30.0),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20.0),
//     ),
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           //color: Color(0xFF3C4858),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0))),
//       onPressed: () => id == "0"
//           ? Get.toNamed(parsedRoute + "/" + id)
//           : Get.toNamed(parsedRoute),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               alignment: Alignment.center,
//               margin: const EdgeInsets.only(left: 40.0),
//               child: Text(
//                 parseString(caption), //'Let\'s go',
//                 style: const TextStyle(color: Colors.white, fontSize: 18.0),
//               ),
//             ),
//           ),
//           Container(
//             height: 40.0,
//             width: 40.0,
//             decoration: const BoxDecoration(
//                 shape: BoxShape.circle, color: Colors.white),
//             child: const Icon(
//               Icons.arrow_forward,
//               color: kSecondaryColor, //Color(0xFF3C4858),
//               size: 20.0,
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

showBusyIndicator() {
  return const Center(child: SpinKitHourGlass(color: Colors.orange));
}

void showToastMessage(String type, String title, String message) async {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: type == 'error' ? Colors.red : Colors.green,
    colorText: Colors.white,
    icon: Icon(type == 'error' ? Icons.error : Icons.check_circle,
        color: Colors.white),
  );
}

var languages = [
  {"text": 'EN', "image": "assets/images/uk.png"},
  {"text": 'TR', "image": "assets/images/tr.png"},
  {"text": 'DE', "image": "assets/images/de.png"},
  {"text": 'RU', "image": "assets/images/ru.png"},
];

getBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    )),
    backgroundColor: Colors.white,
    context: context,
    constraints: const BoxConstraints(maxWidth: maxWidth, minHeight: 220),
    builder: (BuildContext context) {
      return Wrap(children: <Widget>[
        Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            child: child),
      ]);
    },
  );
}
