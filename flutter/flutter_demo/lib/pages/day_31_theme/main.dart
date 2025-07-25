import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/pages/day_31_theme/app_routes.dart';

import 'app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Day 31 Theme Demo',
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.theme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
