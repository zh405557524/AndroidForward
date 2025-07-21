import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 27 - 首页"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.profile), child: const Text("访问 Profile(需登录)")),
          ElevatedButton(onPressed: () => Get.toNamed(AppRoutes.login), child: const Text("去登录页"))
        ],
      ),
    );
  }
}
