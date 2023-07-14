import 'package:dio/dio.dart';

import '../../app_core.dart';
import 'dio_interceptor.dart';

class DioProvider {
  Dio? _dio;

  DioProvider() {
    _init();
  }

  Dio? get dio => this._dio;

  Dio? _init() {
    BaseOptions options = BaseOptions(
      baseUrl: AppCoreUrl.core,
      followRedirects: false,
      receiveTimeout: 2000,
      validateStatus: (statusCode) => true,
    );

    this._dio = Dio(options);
    this._dio!..interceptors.add(AppInterceptors());
    return this._dio;
  }
}
