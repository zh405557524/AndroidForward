import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day_27_middleware/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("个人中心")),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          AuthService.logout();
          Get.offAllNamed(AppRoutes.home);
        },
        child: const Text("登出登录"),
      )),
    );
  }
}
