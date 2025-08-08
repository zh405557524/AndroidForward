import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day_32_localization/app_routes.dart';
import 'package:flutter_demo/pages/day_32_localization/localization_service.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Day 32 Localization',
        translations: LocalizationService(),
        locale: LocalizationService.fallbackLocal,
        fallbackLocale: LocalizationService.fallbackLocal,
        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.locale,
        theme: ThemeData(primarySwatch: Colors.blue));
  }
}
