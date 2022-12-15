import 'package:get/get.dart';
import '../controllers/app_controller.dart';
import 'api_service.dart';
import 'storage_service.dart';

abstract class AppServices {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    //await Get.putAsync(() => SettingsService().init());
    await Get.putAsync(() => ApiService().init());
    // await Get.put(ApiCacheService()).init();
    //await Get.put(SessionService()).init();
    // print("appcontroller await");
    // await Get.putAsync(() => AppController().init());
    // print("appcontroller done");

    /// request for notifications permissions.
    //await FirebaseService.get().initFCM();
  }
}
