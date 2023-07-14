import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:hcp_test/modules/splash/routes/splash_routes.dart';

import '../../app_core.dart';
import '../../widgets/c_isloading.dart';

class AppInterceptors extends Interceptor {
  // final AuthController _auth;

  AppInterceptors();

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode! >= 500) Get.offAllNamed(SplashRoutes.SPLASH_ERROR_GENERIC_PAGE);
    return super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    isLoading(state: false);
    Get.offAllNamed(SplashRoutes.SPLASH_ERROR_GENERIC_PAGE);
    return super.onError(err, handler);
  }
}
