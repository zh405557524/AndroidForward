

import 'package:flutter_demo/pages/day_31_theme/theme_page.dart';
import 'package:get/get.dart';

class AppRoutes{
  static const theme = '/theme';

  static final routes= [
    GetPage(name: theme, page:()=> const ThemePage()
    )
  ];
}