import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/post_controller.dart';

class PostListPage extends StatelessWidget {
  PostListPage({super.key});

  final controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Day 21 - 网络请求演示")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
            itemCount: controller.postList.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final post = controller.postList[index];
              return ListTile(title: Text(post.title), subtitle: Text(post.body));
            });
      }),
    );
  }
}
