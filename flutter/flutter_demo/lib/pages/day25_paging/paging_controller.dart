import 'package:flutter_demo/models/article_model.dart';
import 'package:flutter_demo/pages/day25_paging/paging_service.dart';
import 'package:get/get.dart';

class PagingController extends GetxController {
  var articles = <Article>[].obs;
  var page = 1;
  final pageSize = 10;
  var hasMore = true.obs;

  @override
  void onInit() {
    refreshList();
    super.onInit();
  }

  Future<void> refreshList() async {
    page = 1;
    final data = await PagingService.fetchArticles(page: page, size: pageSize);
    articles.clear();
    articles.addAll(data);
    hasMore.value = data.length == pageSize;
  }

  Future<void> loadMore() async {
    if (!hasMore.value) return;
    page++;
    final data = await PagingService.fetchArticles(page: page, size: pageSize);
    articles.addAll(data);
    hasMore.value = data.length == pageSize;
  }
}
