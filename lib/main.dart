import 'package:cht1/not_found_view.dart';
import 'package:cht1/routes.dart';
import 'package:cht1/pages/splash/splash_view.dart';
import 'package:cht1/theme.dart';
import 'package:cht1/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Opex Messaging',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      theme: lightThemeData(context),
      getPages: Routes.routes,
      initialRoute: Routes.INITIAL,
      unknownRoute: GetPage(
          name: AppRoutes.notFoundPage, page: () => const UnknownView()),
      home: SplashView(),
    );
  }
}
