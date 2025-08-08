import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../day_33_locale_theme/app_routes.dart';
import 'app_theme.dart';
import 'localization_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Day 33 Locale & Theme',
      translations: LocalizationService(),
      locale: LocalizationService.fallbackLocale,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.localeTheme,
    );
  }
}
