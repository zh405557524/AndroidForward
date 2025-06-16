import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_demo/utils/toast_util.dart';
import 'package:get/get_core/src/get_main.dart';

import 'base_response.dart';

class ApiClient {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://example.com/api',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ))
    ..interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ))
    ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers['Authorization'] = 'Bearer your_token';
      return handler.next(options); // continue
    }, onError: (e, handler) {
      ToastUtil.show("网络错误:${e.message ?? "未知错误"}");
      return handler.next(e);
    }));

  static Future<BaseResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, required T Function(dynamic json) fromJson}) async {
    final res = await _dio.get(path, queryParameters: queryParameters);
    return BaseResponse<T>.fromJson(res.data, fromJson);
  }

  static Future<BaseResponse<T>> post<T>(String path,
      {dynamic data, required T Function(dynamic json) fromJsonT}) async {
    final res = await _dio.post(path, data: data);
    return BaseResponse<T>.fromJson(res.data, fromJsonT);
  }
}
