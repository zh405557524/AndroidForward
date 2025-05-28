import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../../models/article_model.dart';

class ArticleController extends GetxController {
  var articles = <Article>[].obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      articles.value = data.map((e) => Article.fromJson(e)).toList();
    } else {
      Get.snackbar("错误", "获取数据失败");
    }
    isLoading.value = false;
  }
}
