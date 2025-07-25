import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/pages/day_30_mini_app/app_routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Day 30 Mini App",
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.home,
    );
  }
}
