import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Day 29 - DI模块化')),
        body: Center(
            child: Obx(() => Text(
                  '计数器:${controller.count.value}',
                  style: const TextStyle(fontSize: 28),
                ))),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: "add", onPressed: controller.increment, child: const Icon(Icons.add)),
            const SizedBox(height: 12),
            FloatingActionButton(
                heroTag: 'reset', child: const Icon(Icons.refresh), onPressed: controller.reset)
          ],
        ));
  }
}
