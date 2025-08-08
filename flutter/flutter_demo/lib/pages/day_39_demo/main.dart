import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day_39_demo/services/theme_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_demo/pages/day_39_demo/app_routes.dart';
import 'package:flutter_demo/pages/day_39_demo/app_theme.dart';
import 'package:flutter_demo/pages/day_39_demo/modules/home/home_page.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeService()); // 全局注入主题服务
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();
    return GetMaterialApp(
      title: 'Day 39 实战整合 Demo',
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.home,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeService.theme,
    );
  }
}
