import 'package:flutter_demo/pages/day_28_binding/detail_binding.dart';
import 'package:flutter_demo/pages/day_28_binding/detail_page.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class AppRoutes {
  static const home = '/home';
  static const detail = '/detail';

  static final routes = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: detail, page: () => const DetailPage(), binding: DetailBinding())
  ];
}
