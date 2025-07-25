import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../day_30_mini_app/app_routes.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 30 - 首页')),
      body: Center(
        child: Obx(() => Text(
              '点击次数：${controller.count}',
              style: const TextStyle(fontSize: 32),
            )),
      ),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: controller.increment),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Mini App 导航')),
            ListTile(
              title: const Text('个人中心'),
              onTap: () => Get.toNamed(AppRoutes.profile),
            )
          ],
        ),
      ),
    );
  }
}
