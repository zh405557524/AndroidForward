import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day20_article_app/article_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'article_controller.dart';
import 'article_detail_page.dart';

class ArticleListPage3 extends StatelessWidget {
  ArticleListPage3({super.key});

  final controller = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Day 20 - 圖文卡片列表')),
        body: Obx(() => EasyRefresh(
            onRefresh: () async => controller.loadArticles(),
            child: ListView.builder(
                itemCount: controller.articles.length,
                itemBuilder: (context, index) {
                  final article = controller.articles[index];
                  return ArticleCard(
                      article: article,
                      onTap: () {
                        Get.to(() => ArticleDetailPage(articleId: article.id));
                      });
                }))));
  }
}
