import 'package:flutter_demo/models/user_model.dart';
import 'package:get/get.dart';

import '../services/user_service.dart';

class UserController extends GetxController {
  var userList = <User>[].obs; // 用户列表
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  Future<void> loadUsers() async {
    isLoading.value = true;
    try {
      final users = await UserService.getUserList();
      userList.value = users;
    } catch (e) {
      print("加载用户失败: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
