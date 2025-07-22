import 'package:flutter_demo/pages/day_29_di_modular/home/home_binding.dart';
import 'package:flutter_demo/pages/day_29_di_modular/home/home_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = '/home';
  static final routes = [GetPage(name: home, page: () => const HomePage(), binding: HomeBinding())];
}
