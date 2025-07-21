import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'AppRoutes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 26 - 首页"),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.profile), child: const Text("跳转到 Profile 页面"))),
    );
  }
}
