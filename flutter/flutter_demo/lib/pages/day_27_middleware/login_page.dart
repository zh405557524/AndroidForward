import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day_27_middleware/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("登录")),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              AuthService.login();
              if (Get.previousRoute == AppRoutes.profile) {
                Get.offAllNamed(AppRoutes.profile);
              } else {
                Get.offAllNamed(AppRoutes.home);
              }
            },
            child: const Text("一键登录")),
      ),
    );
  }
}
