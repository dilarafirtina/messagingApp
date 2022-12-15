import 'package:get/get.dart';

import '../controllers/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController(), permanent: true);
    // Get.put<LifeCycleController>(LifeCycleController(), permanent: true);
  }
}
