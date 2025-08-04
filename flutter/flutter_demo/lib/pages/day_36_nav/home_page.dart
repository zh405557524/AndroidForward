import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'app_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _menus = const [
    {'title': '个人中心', 'icon': Icons.person, 'route': AppRoutes.profile},
    {'title': '设置', 'icon': Icons.settings, 'route': AppRoutes.settings},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 36 - 首页导航'),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: _menus.length,
        itemBuilder: (context, i) => ListTile(
          leading: Icon(_menus[i]['icon'] as IconData),
          title: Text(_menus[i]['title'] as String),
          onTap: () => Get.toNamed(_menus[i]['route'] as String),
        ),
      ),
    );
  }
}
