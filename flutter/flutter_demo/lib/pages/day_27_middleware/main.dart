import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'app_routes.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Day 27 - 中间件演示",
      getPages:AppRoutes.routes,
      initialRoute: AppRoutes.home,
    );
  }

}