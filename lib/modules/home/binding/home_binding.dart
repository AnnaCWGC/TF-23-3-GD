import 'package:get/get.dart';
import 'package:hcp_test/modules/home/controller/home_controller.dart';
import 'package:hcp_test/modules/home/providers/home_provider.dart';
import 'package:hcp_test/modules/home/repositories/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));

    Get.lazyPut(() => HomeProvider());
    Get.lazyPut(() => HomeRepository(Get.find()));
  }
}
