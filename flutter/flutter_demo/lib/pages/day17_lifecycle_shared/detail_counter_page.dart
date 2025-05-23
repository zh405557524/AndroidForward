import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day16_getx_counter/counter_controller.dart';
import 'package:get/get.dart';

class DetailCounterPage extends StatelessWidget {
  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Day 17 - 详情界面"),
        ),
        body: Center(child: Obx(() => Text("计数值${controller.count}"))),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: controller.increment,
        ));
  }
}
