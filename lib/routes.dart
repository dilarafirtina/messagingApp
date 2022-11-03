import 'package:cht1/not_found_view.dart';
import 'package:cht1/pages/home/home_view.dart';
import 'package:cht1/pages/splash/splash_view.dart';
import 'package:cht1/utils/app_routes.dart';
import 'package:get/get.dart';

class Routes {
  static const INITIAL = AppRoutes.splash;
  static const ERROR = AppRoutes.notFoundPage;
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: AppRoutes.notFoundPage,
      page: () => const UnknownView(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const Home(),
    ),
  ];
}
