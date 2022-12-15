import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:url_launcher/url_launcher.dart';

import '../models/menuslider_model.dart';
import '../widgets/widgets.dart';
import 'configuration.dart';

parseSliderImages(value) {
  List<MenuSlider> newList = [];
  if (value == null || value == "") return newList;
  value = value.replaceAll("\'", "\"");
  var list = json.decode(value);
  for (var val in list) {
    newList.add(MenuSlider(order: 1, imageUrl: val));
  }
  return newList;
}

parseArray(value) {
  List<int> newList = [];
  if (value == null || value == "") return newList;
  var list = json.decode(value);
  for (var val in list) {
    newList.add(val);
  }
  return newList;
}

// bool isAuthanticated() {
//   var token = readStorage("token");
//   if (token == null || token == "") return false;
//   if (readStorage("tenantId") == 0) return false;
//   if (readStorage("companyId") == 0) return false;
//   var loginDate = readStorage("loginDate");
//   print(loginDate);
//   return true;
//   //Get.toNamed("/login", arguments: "/housekeeping");
// }

bool parseBool(String? value) {
  return value == null ? false : value.toLowerCase() == 'true';
}

bool toBool(bool? value) {
  return value ?? false;
}

int toInt(dynamic value) {
  if (value == null || value == "") return 0;
  try {
    return int.parse(value.toString());
  } catch (error) {
    return 0;
  }
}

String toTime(DateTime value) {
  try {
    final dateFormatter = DateFormat('HH:mm');
    final dateString = dateFormatter.format(value);
    return dateString;
  } catch (e) {
    return "";
  }
}

String toSqlDate(DateTime value) {
  try {
    final dateFormatter = DateFormat('yyyy-MM-dd');
    final dateString = dateFormatter.format(value);
    return dateString;
  } catch (e) {
    return "";
  }
}

String formatDate(DateTime? value) {
  if (value == null) {
    return "";
  } else {
    return DateFormat.yMd().format(value);
  }
}

String formatDateTime(DateTime? value) {
  if (value == null) {
    return "";
  } else {
    return DateFormat.yMd().add_Hm().format(value);
  }
}

String parseString(String? value) {
  if (value == null) return "";
  try {
    return value.toString();
  } catch (error) {
    return "";
  }
}

showSnackBar(String title, String message) {
  Get.snackbar(
    title.tr,
    message.tr,
    snackPosition: SnackPosition.BOTTOM,
  );
}

showWarning(String message) {
  Get.snackbar(
    "Warning".tr,
    message.tr,
    backgroundColor: Colors.yellow[700],
    snackPosition: SnackPosition.BOTTOM,
  );
}

showSuccess(String message) {
  Get.snackbar(
    "Done".tr,
    message.tr,
    backgroundColor: Colors.green[300],
    snackPosition: SnackPosition.BOTTOM,
  );
}

showAlert(String message) {
  Get.snackbar(
    "Alert".tr,
    message.tr,
    backgroundColor: Colors.red[200],
    snackPosition: SnackPosition.TOP,
  );
}

showNotification(String title, String message, String? imageUrl) {
  Get.snackbar(title.tr, message.tr,
      titleText: header(title),
      messageText: Column(children: <Widget>[
        imageUrl != null ? Image.network(imageUrl) : Container(),
        subTitle(message),
      ]),
      backgroundColor: Colors.white54,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 30));
}

closeOpenedDialog() {
  if (toBool(Get.isBottomSheetOpen)) Get.back();
  if (toBool(Get.isSnackbarOpen)) Get.back();
  if (toBool(Get.isDialogOpen)) Get.back();
}

showDefaultDialog(String title, String message) {
  closeOpenedDialog();
  Get.defaultDialog(title: title.tr, content: Text(message.tr));
}

showContentDialog(String title, Widget content) {
  closeOpenedDialog();
  Get.defaultDialog(title: title.tr, content: content

      // DropdownButton(
      //     dropdownColor: Colors.white,
      //     style: TextStyle(color: Colors.black87),
      //     value: 0,
      //     items: [
      //       DropdownMenuItem(
      //         child: Text("New"),
      //         value: 0,
      //       ),
      //       DropdownMenuItem(
      //         child: Text("Importance"),
      //         value: 1,
      //       ),
      //     ],
      //     onChanged: (value) {}),
      );
}

showErrorDialog(String title, String message) {
  //closeOpenedDialog();
  Get.defaultDialog(
    title: title.tr,
    content: Column(children: <Widget>[
      const SizedBox(
        height: 200,
        width: 200,
        child: Icon(
          Icons.error_rounded,
          size: 70,
          color: kPrimaryColor,
        ),
      ),
      Text(message.tr, maxLines: 10),
    ]),
    //onConfirm: onConfirm,
    //onCancel: () => {Get.back()},
  );
}

showConfirmDialog(
    {required String title,
    required String message,
    dynamic onConfirm,
    required Widget content}) {
  closeOpenedDialog();
  Get.defaultDialog(
      title: title.tr,
      content: Column(children: <Widget>[
        const SizedBox(
          height: 200,
          width: 200,
        ),
        Text(message.tr),
      ]),
      //onConfirm: onConfirm,
      //onCancel: () => Get.back(),
      confirm: GestureDetector(
          onTap: onConfirm, child: smallColoredButton(Icons.thumb_up)),
      cancel: GestureDetector(
          onTap: () => Get.back(),
          child: smallColoredButton(Icons.multiple_stop)));
}

// showBusyIndicator() {
//   Future.delayed(
//       Duration.zero,
//       () => Get.dialog(Center(child: CircularProgressIndicator()),
//           barrierDismissible: false));
// }

showBottomSheet() {
  Get.bottomSheet(
    Wrap(
      children: <Widget>[
        ListTile(
            leading: const Icon(Icons.music_note),
            title: const Text('Music'),
            onTap: () => {}),
        ListTile(
          leading: const Icon(Icons.videocam),
          title: const Text('Video'),
          onTap: () => {},
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    ),
    backgroundColor: Colors.white,
  );
}

showNetworkImage(String imageLink) {
  closeOpenedDialog();
  Get.defaultDialog(
      title: "",
      content: Column(children: <Widget>[
        SizedBox(height: 500, width: 500, child: Image.network(imageLink)),
      ]),
      cancel: GestureDetector(
          onTap: () => Get.back(), child: smallColoredButton(Icons.cancel)));
}

//Get.find<AuthController>().user.uid;
//print('The last character: ${hi.characters.last}\n');
//NOtes
//\$ 745.00

//lounch utils
Future<void> launchPhone(String url) async {
  String phoneSchema = url.replaceAll(' ', '');
  if (await canLaunchUrl(Uri(scheme: 'tel', path: phoneSchema))) {
    await launchUrl(Uri(scheme: 'tel', path: phoneSchema));
  } else {
    showAlert('Could not launch $url');
  }
}

Future<void> launchInBrowser(String? url) async {
  if (url == null || url == "") return;
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.platformDefault,
    webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: true, enableDomStorage: true),
  )) {
    showAlert('Could not launch $url');
  }
}

Future<void> launchEmail(String url) async {
  if (await canLaunchUrl(Uri(scheme: 'mailto', path: url))) {
    await launchUrl(Uri(scheme: 'mailto', path: url));
  } else {
    showAlert('Could not launch $url');
  }
}

Future<void> launchMap(String lat, String long) async {
  var mapSchema = '$lat,$long';
  if (GetPlatform.isIOS) {
    mapSchema = 'http://maps.apple.com/?ll=$lat,$long'; //?q=${lat},${long}';
  } else {
    mapSchema =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long'; //'geo:$lat,$long';
  }
  if (!await launchUrl(Uri.parse(mapSchema),
      mode: LaunchMode.externalApplication)) {
    showAlert('Could not launch map');
  }
  // final label = company.fullname;
  // final query = '$lat,$long($label)';
  // final uri = Uri(scheme: 'geo', host: '0,0', queryParameters: {'q': query});
  // if (await canLaunchUrl(uri)) {
  //   await launchUrl(uri);
  // } else {
  //   showAlert('Could not launch $uri');
  // }
}

Future<void> launchWhatsApp(String phone) async {
  String whatsAppUrl = "";

  String phoneNumber = phone.replaceAll(' ', '');
  String description = "Hi,";

  if (GetPlatform.isIOS) {
    whatsAppUrl =
        'whatsapp://wa.me/$phoneNumber/?text=${Uri.parse(description)}';
  } else {
    whatsAppUrl = 'https://wa.me/+$phoneNumber?text=${Uri.parse(description)}';
  }
// launchUrl(Uri.parse('https://wa.me/$countryCode$contactNo?text=Hi'),
//                     mode: LaunchMode.externalApplication);
  if (!await launchUrl(Uri.parse(whatsAppUrl),
      mode: LaunchMode.externalApplication)) {
    showAlert('Could not launch WhatsApp');
  }
}

Future<void> launchInWebViewWithJavaScript(String? url) async {
  if (url == null || url == "") return;
  if (!await launchUrl(
    Uri(scheme: 'https', host: url, path: 'headers/'),
    mode: LaunchMode.inAppWebView,
    webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: true, enableDomStorage: true),
  )) {
    showAlert('Could not launch $url');
  }
}

parseRoute(route) {
  return "/" + parseString(route);
}

String escapedString(value) {
  return value
      .replaceAll('\n', '\\n')
      .replaceAll(r"\'", "\\'")
      //.replaceAll("\\"", "\"")
      .replaceAll(r"\&", "\\&")
      .replaceAll('\r', '\\r')
      .replaceAll("\t", "\\t")
      .replaceAll("\b", "\\b")
      .replaceAll("\f", "\\f");
}

String unEscapedString(value) {
  return value
      .replaceAll('\\n', '\n')
      .replaceAll("\\'", r"\'")
      //.replaceAll("\\"", "\"")
      .replaceAll("\\&", r"\&")
      .replaceAll('\\r', '\r')
      .replaceAll("\\t", "\t")
      .replaceAll("\\b", "\b")
      .replaceAll("\\f", "\f");
}
