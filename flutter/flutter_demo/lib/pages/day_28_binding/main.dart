import 'package:flutter/cupertino.dart';
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
      title: 'Day 28 Binding Demo',
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.home,
    );
  }
}
