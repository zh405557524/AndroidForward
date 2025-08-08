import 'package:dio/dio.dart';

class ApiService {
  static final _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  static Future<List<dynamic>> getPosts() async {
    final response = await _dio.get('/posts');
    return response.data; // 返回数据列表
  }
}
