

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day19_shared_refresh/article_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/article_model.dart';
import 'article_list_page.dart';


class ArticleDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //接受传参
    final Article article = Get.arguments as Article;
    final controller = Get.find<ArticleController>();
    final TextEditingController textController = TextEditingController(text: article.title);

    return Scaffold(
      appBar: AppBar(title: const Text("详情页 - 修改标题"),),
      body: Padding(padding: const EdgeInsets.all(16)
        ,
        child: Column(
          children: [
            TextField(controller:textController),
            const SizedBox(height:20),
            ElevatedButton(
              onPressed:(){
                controller.updateArticleTitle(article.id,textController.text);
                Get.back();
              },
              child: const Text("保存标题"),
            )
          ],
        ),

      ),

    );
  }
}
