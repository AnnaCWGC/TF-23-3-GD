import 'package:get/get.dart';

import '../../../services/common/storage_local.dart';
import '../controller/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StorageLocal());
    Get.lazyPut(() => SplashController(Get.find(),));
  }
}
