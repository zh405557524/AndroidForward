import 'package:dio/dio.dart';
import 'package:flutter_demo/http/Api.dart';
import 'package:flutter_demo/utils/log_utils.dart';

class HttpManager {
  late Dio _dio;
  static HttpManager? _instance;

  factory HttpManager.getInstance() {
    _instance ??= HttpManager._internal();
    return _instance!;
  }

  HttpManager._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    );
    _dio = Dio(options);
  }

  request(String url, {String method = "get", Map<String, dynamic>? params}) async {
    try {
      Response response = await _dio.request(url, queryParameters: params, options: Options(method: method));
      return response.data;
    } catch (e) {
      LogUtil.i("Http", "HttpManager request error: $e");

      return null;
    }
  }
}

