import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../services/theme_service.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("设置")),
      body: Center(
        child: ElevatedButton(
            child: const Text("切换主题(明/暗)"), onPressed: () => Get.find<ThemeService>().switchTheme()),
      ),
    );
  }
}
