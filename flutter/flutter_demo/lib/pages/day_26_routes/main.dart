import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/pages/day_26_routes/AppRoutes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Day 26 -模块化路由演示",
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.home,
    );
  }
}
