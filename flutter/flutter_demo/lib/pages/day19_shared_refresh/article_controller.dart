import 'package:flutter_demo/models/article_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ArticleController extends GetxController {
  var articles = <Article>[].obs;

  @override
  void onInit() {
    articles.assignAll(
        List.generate(10, (i) => Article(id: i, title: '文章标题 $i', body: '这是文章内容 $i。这里是一些示例文本，用于展示文章的内容部分。')));
    super.onInit();
  }

  void updateArticleTitle(int id, String newTitle) {
    final index = articles.indexWhere((a) => a.id == id);
    if (index != -1) {
      articles[index].title = newTitle;
      articles.refresh(); // 刷新列表以更新UI,必须调用
    }
  }
}
