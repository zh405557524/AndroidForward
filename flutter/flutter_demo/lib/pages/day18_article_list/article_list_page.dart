import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';

import 'article_controller.dart';

class ArticleListPage extends StatelessWidget {
  ArticleListPage({super.key});

  final controller = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 18 -文章列表')),
      body: Obx(() {
        return EasyRefresh(
            onRefresh: controller.fetchArticles,
            child: ListView.separated(
                itemCount: controller.articles.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final article = controller.articles[index];
                  return ListTile(
                      title: Text(article.title),
                      subtitle: Text(
                        article.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ));
                }));
      }),
    );
  }
}
