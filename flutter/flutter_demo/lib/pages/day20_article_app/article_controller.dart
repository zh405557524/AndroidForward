import 'package:flutter_demo/pages/day20_article_app/article_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ArticleController extends GetxController {
  var articles = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadArticles();
  }

  void loadArticles() {
    articles.value = List.generate(
        8,
        (i) => Article(
            id: i,
            title: '文章标题 $i',
            summary: '这是文章摘要 $i。这里是一些示例文本，用于展示文章的摘要部分。',
            cover: 'https://picsum.photos/id/${100 + i}/400/200'));
  }

  void updateArticle(int id, String newTitle, String newSummary) {
    final index = articles.indexWhere((e) => e.id == id);
    if (index != -1) {
      articles[index].title = newTitle;
      articles[index].summary = newSummary;
      articles.refresh(); // 刷新列表以更新UI
    }
  }
}
