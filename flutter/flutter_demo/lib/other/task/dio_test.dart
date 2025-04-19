import 'package:dio/dio.dart';

main() async {
  var dio = Dio();
  Response response = await dio.get('https://www.wanandroid.com/banner/json');
  print(response.data.toString());
}
