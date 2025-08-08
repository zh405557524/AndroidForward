import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'article_controller.dart';

class ArticleDetailPage extends StatelessWidget {
  final int articleId;

  ArticleDetailPage({super.key, required this.articleId});

  final controller = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    final article = controller.articles.firstWhere((e) => e.id == articleId);
    final titleCtrl = TextEditingController(text: article.title);
    final summaryCtrl = TextEditingController(text: article.summary);
    return Scaffold(
      appBar: AppBar(title: Text('编辑:${article.title}')),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: "标题")),
              const SizedBox(height: 12),
              TextField(controller: summaryCtrl, decoration: const InputDecoration(labelText: "简介")),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.updateArticle(articleId, titleCtrl.text, summaryCtrl.text);
                  Get.back();
                },
                child: const Text("保存修改并返回"),
              )
            ],
          )),
    );
  }
}
