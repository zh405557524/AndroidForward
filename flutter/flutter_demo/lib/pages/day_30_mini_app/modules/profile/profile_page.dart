import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo/pages/day_30_mini_app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('个人中心')),
      body: Center(
        child: Obx(() {
          final user = controller.user.value;
          if (user == null) return const CircularProgressIndicator();
          return Text("用户名:${user.name}\n邮箱:${user.email}",
              style: const TextStyle(fontSize: 22), textAlign: TextAlign.center);
        }),
      ),
    );
  }
}
