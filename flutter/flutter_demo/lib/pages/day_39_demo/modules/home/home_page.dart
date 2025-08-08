import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/animated_avatar.dart';
import '../../app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('实战首页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             AnimatedAvatar(),
            const SizedBox(height: 24),
            ElevatedButton(
              child: const Text('个人中心'),
              onPressed: () => Get.toNamed(AppRoutes.profile),
            ),
            ElevatedButton(
              child: const Text('设置'),
              onPressed: () => Get.toNamed(AppRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }
}
