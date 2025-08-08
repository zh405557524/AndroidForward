import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'app_routes.dart';
import 'auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('day 35 首页(已登录)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('已登录，Token:${AuthService.token ?? ''}'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: ()async {
              await AuthService.logout();
              Get.offAllNamed(AppRoutes.login);
            }, child: const Text('退出登录'))
          ],
        ),
      ),
    );
  }
}
