import 'package:cht1/not_found_view.dart';
import 'package:cht1/screens/chats/chats_screen.dart';
import 'package:cht1/screens/home/home_view.dart';
import 'package:cht1/screens/conversation/main_screen.dart';
import 'package:cht1/screens/welcome/splash_screen.dart';
import 'package:cht1/screens/welcome/welcome_screen.dart';
import 'package:cht1/utils/app_routes.dart';
import 'package:get/get.dart';

class Routes {
  static const INITIAL = AppRoutes.splash;
  static const ERROR = AppRoutes.notFoundPage;
  static final routes = [
    GetPage(
      name: AppRoutes.main,
      page: () => MainScreen(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.notFoundPage,
      page: () => const UnknownView(),
    ),
    GetPage(
      name: AppRoutes.chats,
      page: () => ChatsScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => Home(),
    ),
  ];
}
