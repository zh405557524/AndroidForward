import 'package:get/get.dart';

import 'locale_theme_page.dart';

class AppRoutes {
  static const localeTheme = '/locale_theme';
  static final routes = [
    GetPage(name: localeTheme, page: () => const LocaleThemePage())
  ];
}
