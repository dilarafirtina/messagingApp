import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../data/menu_data.dart';
import '../message.dart';
import '../models/company_model.dart';
import '../models/menu_date_model.dart';
import '../models/menu_model.dart';
import '../services/api_service.dart';
import '../utils/app_routes.dart';
import '../utils/dictionary.dart';
import '../utils/utils.dart';

class AppController extends GetxController {
  //var userName = "".obs;
  //final String videoUrl = "https://opexcdn.blob.core.windows.net/ela/Mobil_App_Opener.mp4";
  // String backUrl = "";
  //Menu? selectedItem;
  var isReady = false.obs;
  // var selectedMenuId = 0.obs;
  dynamic selectedBottomItem;
  var sliderOrder = 0.obs;
  late var item = Menu(id: 0, name: "").obs;
  int id = 0;
  //Menu? previousMenu;
  //var loaded = 0.obs;
  var dataList = <Menu>[].obs;
  //var selectedIndex = 0.obs;

  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void onInit() async {
    await loadMenu();
    super.onInit();
  }

  // Future init() async {
  //   print("init load");
  //   return await this.loadMenu();
  // }

  loadMenu() async {
    isReady(false);
    ApiRequest execRequest = ApiRequest(
        action: "Execute",
        object: "GuestAppMenu",
        baseObject: "GUESTAPP_PAGES",
        parameters: {});
    ApiResponse response = await ApiService().httpPost(execRequest);
    if (response.success) {
      List list;
      if (response.resultSets!.isNotEmpty) {
        list = response.resultSets![0];
        if (list.isNotEmpty) {
          menuData = (list).map((i) => Menu.fromMap(i)).toList().cast<Menu>();
        } else {
          Get.offNamed("/formError");
        }
      }
      if (response.resultSets!.length > 1) {
        list = response.resultSets![1];
        if (list.isNotEmpty) {
          company.value = Company(
              id: list[0]["ID"] ?? 0,
              fullname: list[0]["FULLNAME"] ?? "",
              firstname: list[0]["FIRSTNAME"] ?? "",
              lastname: list[0]["LASTNAME"] ?? "",
              www: list[0]["WWW"] ?? "",
              phone: list[0]["PHONE"] ?? "",
              email: list[0]["EMAIL"] ?? "",
              description: list[0]["DESCRIPTION"] ?? "",
              splashUrl: list[0]["SPLASHURL"] ?? "",
              slogan: list[0]["SLOGAN"] ?? "",
              address: list[0]["ADDRESS"] ?? "",
              lat: list[0]["LAT"] ?? "",
              long: list[0]["LONG"] ?? "",
              whatsAppPhone: list[0]["WHATSAPPPHONE"] ?? "",
              instagram: list[0]["INSTAGRAM"] ?? "",
              facebook: list[0]["FACEBOOK"] ?? "",
              twitter: list[0]["TWITTER"] ?? "",
              youtube: list[0]["YOUTUBE"] ?? "",
              spotify: list[0]["SPOTIFY"] ?? "",
              tiktok: list[0]["TIKTOK"] ?? "",
              vk: list[0]["VK"] ?? "",
              ok: list[0]["OK"] ?? "",
              pinterest: list[0]["PINTEREST"] ?? "",
              swarm: list[0]["SWARM"] ?? "",
              linkedin: list[0]["LINKEDIN"] ?? "",
              gdprlink: list[0]["GDPRLINK"] ?? "",
              emailpermissionlink: list[0]["EMAILPERMISSIONLINK"] ?? "");
        } else {
          Get.offNamed("/formError");
        }
      }
      if (response.resultSets!.length > 2) {
        list = response.resultSets![2];
        if (list.isNotEmpty) {
          menuDisplay = (response.resultSets![2])
              .map((i) => MenuDisplay.fromMap(i))
              .toList()
              .cast<MenuDisplay>();
        }
      }
      if (response.resultSets!.length > 3) {
        list = response.resultSets![3];
        if (list.isNotEmpty) {
          Map<String, dynamic> language = jsonDecode(list[0]["VALUE"]);
          Map<String, String> language1 =
              language.map((key, value) => MapEntry(key, value!.toString()));
          Map<String, Map<String, String>> map = {"tr": language1};
          Get.find<Dictionary>().map = map;
        }
      }
      Menu? drawer = menuData.firstWhereOrNull(
          (element) => element.name.toLowerCase() == "drawer");
      if (drawer == null) {
        drawerMenu = [];
      } else {
        if (drawer.items != null) {
          for (var i = 0; i < drawer.items!.length; i++) {
            var menu = menuData
                .firstWhereOrNull((element) => element.id == drawer.items![i]);
            if (menu != null) {
              drawerMenu.add(menu);
            }
          }
        }
      }

      Menu? bottomMenu = menuData.firstWhereOrNull(
          (element) => element.name.toLowerCase() == "bottommenu");
      if (bottomMenu == null) {
        bottomMenuItems = [];
      } else {
        if (bottomMenu.items != null) {
          for (var i = 0; i < bottomMenu.items!.length; i++) {
            var menu = menuData.firstWhereOrNull(
                (element) => element.id == bottomMenu.items![i]);
            if (menu != null) {
              bottomMenuItems.add(menu);
            }
          }
        }
      }

      //drawerMenu.add(Menu(id: 21, name: "Lang", title: "Lang", route: "/"));
      isReady(true);
    }

    setupFCM();
    getFcmToken();
  }

  // Future loadDictionary() async {
  //   isReady(false);
  //   Map<String, Map<String, String>> map = {
  //     "en": {"aa": "bb"}
  //   };
  //   ApiRequest execRequest = ApiRequest(
  //       action: "Execute",
  //       object: "GuestAppDictionary",
  //       baseObject: "GUESTAPP_PAGES",
  //       parameters: {});
  //   ApiResponse response = await httpPost(execRequest, apiToken);
  //   if (response.success) {
  //     List list;
  //     if (response.resultSets!.isNotEmpty) {
  //       list = response.resultSets![0];
  //       if (list.isNotEmpty) {
  //         Map<String, dynamic> language = jsonDecode(list[0]["VALUE"]);
  //         Map<String, String> language1 =
  //             language.map((key, value) => MapEntry(key, value!.toString()));
  //         map = {"tr": language1};
  //       }
  //     }
  //     Get.find<Dictionary>().map = map;
  //   }
  //   isReady(true);
  // }
  handleMenu() {
    isReady.value = false;
    sliderOrder.value = 1;
    id = toInt(Get.parameters["id"]);
    if (id == 0) id = 1;
    if (menuData.isNotEmpty) {
      item.value = menuData.singleWhere((element) => element.id == id);
    } else {}
    isReady.value = true;
  }

  void openDrawer(GlobalKey<ScaffoldState> key) {
    key.currentState?.openEndDrawer();
  }

  void closeDrawer(GlobalKey<ScaffoldState> key) {
    key.currentState?.openEndDrawer();
  }

  void sliderOnChange(int index, dynamic reason) {
    sliderOrder.value = index + 1;
  }

  bool menuRoute(String route) {
    if (route.startsWith("/home") ||
        route.startsWith("/list") ||
        route.startsWith("/menu") ||
        route.startsWith("/detail") ||
        route.startsWith("/contact") ||
        route.startsWith("/account") ||
        route.startsWith("/accountDetail") ||
        route.startsWith("/social")) {
      return true;
    } else {
      return false;
    }
  }

  goTo(Menu item) {
    isReady.value = false;
    if (item.route == null || item.route == "") return;
    if (item.route == "/email") {
      if (item.url != null) {
        launchEmail(item.url!);
      }
      return;
    }
    // if (item.route == "/login") {
    //   showLoginDialog();
    //   return;
    // }
    else if (item.route == "/launchInWebview") {
      launchInWebViewWithJavaScript(item.url);
    } else if (item.route == "/launchInBrowser") {
      launchInBrowser(item.url);
    } else if (item.route == "/whatsApp") {
      launchWhatsApp(item.route!);
    } else if (item.route == "/tel") {
      launchPhone(item.route!);
    } //co//company.whatsAppPhone
    else if (item.route == "/webview") {
      Get.toNamed(item.route!, arguments: item.url);
      return;
    } else if (menuRoute(item.route!)) {
      Get.toNamed(item.route! + '/' + item.id.toString());
    } else {
      Get.toNamed(item.route!);
      return;
    }
    this.item.value = item;
    isReady.value = true;
  }

  goBack({bool? returnValue}) {
    if (Get.routing.current.substring(1) == "login") {
      // TODO
      goToMenu("MainPage");
      return;
    }
    Get.back(result: returnValue);
    String currentRoute = Get.routing.current.substring(1);
    if (currentRoute.indexOf("/") > 0) {
      //String backRoute = currentRoute.substring(0, currentRoute.indexOf('/'));
      String itemId = currentRoute.substring(currentRoute.indexOf('/') + 1);
      Menu item =
          menuData.singleWhere((element) => element.id == toInt(itemId));

      goTo(item);
    }
  }

  goToMenuId(int? menuId) {
    if (menuId != null) {
      Menu item = menuData.singleWhere((element) => element.id == menuId);
      goTo(item);
    }
  }

  goToMenu(String name) {
    Menu item = menuData.singleWhere((element) => element.name == name);
    goTo(item);
  }

  goToMenuPageType(String pageType) {
    Menu item = menuData.firstWhereOrNull(
        (element) => element.route!.toLowerCase() == pageType)!;
    goTo(item);
  }

  go(String route) {
    closeOpenedDialog();
    Get.toNamed(route);
  }

  goArguments(String route, String message) {
    closeOpenedDialog();
    Get.toNamed(route, arguments: message);
  }

  Future<String> getFcmToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      ApiService().storage.writeStorage("registerId", token);
      debugPrint(token);
      Map<String, dynamic> parameters = {};
      parameters["TOKEN"] = token;
      parameters["PLATFORM"] =
          GetPlatform.isIOS || GetPlatform.isWeb ? "IOS" : "ANDROID";

      ApiService()
          .execApi("GuestAppToken", "STDUSER_FIREBASETOKEN", parameters);
    }
    return token ?? "";
  }

  Map<String, dynamic>? convertMessage(RemoteMessage message) {
    try {
      if (GetPlatform.isIOS || GetPlatform.isWeb) {
        return {
          'title': "aa", //message['notification']['title'],
          'body': "bb", //message['notification']['body'],
          'order_id': "cc", //message['data']['order_id'],
          'status': "sdd" //message['data']['status'],
        };
        // 'title': message['aps']['alert']['title'],
        // 'body': message['aps']['alert']['body'],
        // 'order_id': message['order_id'],
        // 'status': message['status'],

        // {
        //   "aps" : {
        //     "alert" : {
        //       "body" : "great match!",
        //       "title" : "Portugal vs. Denmark",
        //     },
        //     "badge" : 1,
        //   },
        //   "customKey" : "customValue"
        // }

      } else {
        return {
          'title': "aa", //message['notification']['title'],
          'body': "aa", //message['notification']['body'],
          'order_id': "aa", // message['data']['order_id'],
          'status': "aa" //message['data']['status'],
        };
      }
    } catch (e) {
      return null;
    }
  }

  setupFCM() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('notification');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    // final IOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings(requestAlertPermission: false,requestBadgePermission: false,requestSoundPermission: false,
    //  );

    // final InitializationSettings initializationSettings = InitializationSettings(
    //   android: initializationSettingsAndroid,
    //   iOS: initializationSettingsIOS,
    // );

//     NotificationSettings settings = await messaging.requestPermission(
//   alert: true,
//   announcement: false,
//   badge: true,
//   carPlay: false,
//   criticalAlert: false,
//   provisional: false,
//   sound: true,
// );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//   print('User granted permission');
// } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//   print('User granted provisional permission');
// } else {
//   print('User declined or has not accepted permission');
// }

    if (GetPlatform.isIOS || GetPlatform.isWeb) {
      FirebaseMessaging.instance.requestPermission(
          sound: true,
          badge: true,
          alert: true,
          provisional: false,
          announcement: true,
          carPlay: true);
    }

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Get.toNamed('/message', arguments: MessageArguments(message, true));
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        showNotification(message.notification!.title ?? "",
            message.notification!.body ?? "", android.imageUrl);
        // flutterLocalNotificationsPlugin.show(
        //     notification.hashCode,
        //     notification.title, // Title of our notification
        //     notification.body, // Body of our notification
        //     NotificationDetails(
        //       android: AndroidNotificationDetails(
        //         // This is the channel we use defined above
        //         channel.id,
        //         channel.name,
        //         channel.description,
        //         //The icon is defined in android/app/src/main/res/drawable
        //         icon: 'notification',
        //       ),
        //     ),
        //     //We parse the data from the field view to the callback
        //     //Line 58
        //     payload: message.data["view"]);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //print('A new onMessageOpenedApp event was published!');
      Map<String, dynamic>? convertedMessage = convertMessage(message);
      if (convertedMessage != null) {}
      //Get.toNamed('/message', arguments: MessageArguments(message, true));
    });
  }
}
