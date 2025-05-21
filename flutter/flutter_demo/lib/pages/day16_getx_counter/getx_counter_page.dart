import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'counter_controller.dart';

class GetXCounterPage extends StatelessWidget {
  GetXCounterPage({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 16 - GetX计数器"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "当前计数:",
              style: TextStyle(fontSize: 18),
            ),
            Obx(() => Text("${controller.count}",
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold))),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: controller.decrement,
                child: const Text("-"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: controller.increment, child: const Text("+"))
            ])
          ],
        ),
      ),
    );
  }
}
