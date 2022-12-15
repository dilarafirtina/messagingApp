import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../models/menu_model.dart';
import '../services/api_service.dart';
import '../utils/utils.dart';

class LoginController extends GetxController {
  var activeMenuItem = Menu(id: 0, name: "").obs;
  var showPassword = true.obs;
  var loginType = "inHouse".obs;

  void handleLogin(GlobalKey<FormBuilderState> formKey) async {
    Map<String, dynamic> formData = {};
    if (formKey.currentState!.saveAndValidate()) {
      formKey.currentState?.value.forEach((key, value) {
        formData[key] = value;
      });

      var result = false;
      if (loginType.value == "inHouse") {
        result = await ApiService()
            .guestPMSLogin(formData["room"], formData["bdate"], null, null);
      } else {
        result = await ApiService()
            .guestPMSLogin(null, null, formData["email"], formData["password"]);
      }

      if (result == true) {
        Get.back();
      } else {
        showAlert("I could not recognize you!");
      }
    }
  }

  // void forgetPassword() async {
  //   if (emailTextController.text == null || emailTextController.text == "") {
  //     showWarning("Please enter your mail address");
  //     return;
  //   }

  //   var result = await forgotPassword(
  //       emailTextController.text, tenantTextController.text);
  //   print(result);
  //   String title =
  //       result != "\"User not found\"" ? "Success" : "Error".trArgs([""]);
  //   String message = result != "\"User not found\""
  //       ? "Password reset".replaceFirst("[]", result)
  //       : result.replaceAll("\"", "");
  //   showDefaultDialog(title, message);
  // }

  // void changeTheme() {
  //   if (Get.isDarkMode) {
  //     Get.changeTheme(ThemeData.light());
  //     writeStorage("isDarkMode", false);
  //   } else {
  //     Get.changeTheme(ThemeData.dark());
  //     writeStorage("isDarkMode", true);
  //   }
  // }

  // Future pushNotificationInitialise() async {
  //   final FirebaseMessaging _fcm = FirebaseMessaging();

  //   if (GetGetPlatform.isIOS) {
  //     // request permissions if we're on android
  //     _fcm.requestNotificationPermissions(IosNotificationSettings());
  //   }

  //   var registerId = await _fcm.getToken();
  //   print(registerId);
  //   insertApi("STDUSER_FIREBASETOKEN", {
  //     "HOTELID": readStorage("tenantId"),
  //     "STDUSERID": readStorage("userId"),
  //     "TOKENTYPE": 1,
  //     "TOKEN": registerId
  //   });

  //   // Called when the app is in the foreground and we receive a push notification
  //   _fcm.configure(
  //     onMessage: (Map<String, dynamic> message) async {
  //       print('onMessage: $message');
  //       showConfirmDialog(title: message["title"], message: message['body']);
  //     },
  //     // onBackgroundMessage: GetGetPlatform.isIOS ? null : myBackgroundMessageHandler,
  //     // Called when the app has been closed comlpetely and it's opened
  //     // from the push notification.
  //     onLaunch: (Map<String, dynamic> message) async {
  //       print('onLaunch: $message');
  //     },
  //     // Called when the app is in the background and it's opened
  //     // from the push notification.
  //     onResume: (Map<String, dynamic> message) async {
  //       print('onResume: $message');
  //     },
  //   );
  // }
}
