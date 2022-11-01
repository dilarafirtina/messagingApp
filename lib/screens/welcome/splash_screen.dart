import 'package:cht1/screens/welcome/welcome_screen.dart';
import 'package:cht1/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // demo time it required to load inital data
    Future.delayed(Duration(seconds: 1), () => Get.toNamed(AppRoutes.home));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? "icons/Logo_dark_theme.svg"
              : "icons/Logo_light_theme.svg",
        ),
      ),
    );
  }
}
