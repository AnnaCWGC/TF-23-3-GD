import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:hcp_test/modules/home/routes/home_routes.dart';
import 'package:hcp_test/modules/home/repositories/home_repository.dart';
import 'package:hcp_test/modules/splash/routes/splash_routes.dart';
import 'package:hcp_test/services/common/storage_local.dart';

class SplashController extends GetxController {
  final StorageLocal _storageLocal;

  final RxDouble _opacity = 0.0.obs;

  SplashController(this._storageLocal);

  double get opacity => this._opacity.value;

  @override
  Future<void> onInit() async {
    transitOpacity();
    await connectivityStatus();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  /// Method transitOpacity is used to animate a transition effect
  /// by gradually incrementing the value of `_opacity` every 400 milliseconds.
  void transitOpacity() {
    print("OIII");
    Timer.periodic(Duration(milliseconds: 400), (timer) {
      if (this._opacity.value < 1.0) {
        this._opacity.value++;
      }
    });
  }

  /// Method connectivityStatus checks for internet connectivity.
  /// If no connectivity, it navigates to an error page named SPLASH_ERROR_GENERIC_PAGE.
  /// If there is connectivity, it delays one second and then navigates to HOME_PAGE.
  Future<void> connectivityStatus() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Get.toNamed(SplashRoutes.SPLASH_ERROR_GENERIC_PAGE);
    } else {
      Timer(Duration(seconds: 1), () {
        Get.offAllNamed(HomeRoutes.HOME_PAGE);
      });
    }
  }
}
