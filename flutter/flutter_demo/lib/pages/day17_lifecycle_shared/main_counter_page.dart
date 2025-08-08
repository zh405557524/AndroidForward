import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../day16_getx_counter/counter_controller.dart';
import 'detail_counter_page.dart';

class MainCounterPage extends StatelessWidget {

  MainCounterPage({super.key});

  final controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Day 17 - 主界面")
        ),
        body: Center(
          child: Obx(() => Text("当前计数${controller.count}")),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_forward),
            onPressed: ()=>Get.to(()=>DetailCounterPage()))
    );
  }
}
