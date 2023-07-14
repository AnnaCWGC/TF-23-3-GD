import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

import 'dio_provider.dart';

class ApiBase {
  DioProvider _dio = Get.find();

  Future<Response?> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    bool checkStatusCode = true,
  }) async {
    try {
      Response response =
          await _dio.dio!.get(url, queryParameters: queryParameters);
      // print(
      //     "[StatusCode: ${response.statusCode}] :: [Endpoint: ${response.realUri}] :: [Method: GET] :: [Body Response: ${response.data}]");

      if (checkStatusCode) //_checkStatusCode(response);

        return response;
    } on DioError catch (e) {
      // _checkStatusCode(e.response!);
      print(e);

      return null;
    }
    return null;
  }

  Future<Response?> post(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool checkStatusCode = true,
  }) async {
    try {
      Response response = await _dio.dio!
          .post(url, data: data, queryParameters: queryParameters);
      // print(
      //     "[StatusCode: ${response.statusCode}] :: [Endpoint: ${response.realUri}] :: [Method: POST] :: [Payload: ${data}] :: [Body Response: ${response.data}]");

      if (checkStatusCode) //_checkStatusCode(response);

        return response;
    } on DioError catch (e) {
      // _checkStatusCode(e.response!);
      print(e);

      return null;
    }
    return null;
  }

  Future<Response?> put(String url, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.dio!
          .put(url, data: data, queryParameters: queryParameters);
      // print(
      //     "[StatusCode: ${response.statusCode}] :: [Endpoint: ${response.realUri}] :: [Method: POST] :: [Payload: ${data}] :: [Body Response: ${response.data}]");
      //_checkStatusCode(response);

      return response;
    } on DioError catch (e) {
      // _checkStatusCode(e.response!);
      print(e);

      return null;
    }
  }

  Future<Response?> patch(String url, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.dio!
          .patch(url, data: data, queryParameters: queryParameters);
      // print("Endpoint >>>> " + url);
      // print('Header >>>> ${response}');
      
      //_checkStatusCode(response);

      return response;
    } on DioError catch (e) {
      // _checkStatusCode(e.response!);
      print(e);

      return null;
    }
  }

  Future<Response?> delete(String url, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.dio!
          .delete(url, data: data, queryParameters: queryParameters);

      //_checkStatusCode(response);

      return response;
    } on DioError catch (e) {
      // _checkStatusCode(e.response!);
      print(e);

      return null;
    }
  }
}
