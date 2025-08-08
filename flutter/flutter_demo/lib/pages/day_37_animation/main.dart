import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Day 37 动画 Demo',
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.animList,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
