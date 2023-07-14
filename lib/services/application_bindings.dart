import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hcp_test/modules/home/controller/home_controller.dart';
import 'package:hcp_test/services/common/api_base/dio_provider.dart';
import 'common/storage_local.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(StorageLocal(), permanent: true);
    Get.put(Dio(), permanent: true);
    Get.put(DioProvider(), permanent: true);
  }
}
