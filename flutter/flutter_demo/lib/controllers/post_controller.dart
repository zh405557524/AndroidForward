import 'dart:ffi';

import 'package:flutter_demo/models/post.dart';
import 'package:flutter_demo/services/api_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  var postList = <Post>[].obs;
  var isLoading = false.obs;

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      final data = await ApiService.getPosts();
      postList.value = data.map((e) => Post.fromJson(e)).toList();
    } catch (e) {
      Get.snackbar("错误", "获取数据失败：$e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }
}
