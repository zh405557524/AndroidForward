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
      appBar: AppBar(title: const Text('Day 28 - 首页')),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (_, i) => ListTile(
                title: Text('Item $i'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  Get.toNamed('${AppRoutes.detail}?id=$i&name=Item$i');
                },
              )),
    );
  }
}
