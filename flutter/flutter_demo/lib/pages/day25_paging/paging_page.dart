import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day25_paging/paging_controller.dart';
import 'package:get/get.dart';

class PagingPage extends StatelessWidget {
  final controller = Get.put(PagingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Day 25 -分页加载列表")),
      body: Obx(() => EasyRefresh(
          onRefresh: controller.refreshList,
          onLoad: controller.hasMore.value ? controller.loadMore : null,
          child: ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text("${article.id}"),
                ),
                title: Text(article.title),
              );
            },
          ))),
    );
  }
}
