import 'package:get/get.dart';
import 'hero_page.dart';
import 'implicit_anim_page.dart';
import 'animated_list_page.dart';

class AppRoutes {
  static const hero = '/hero';
  static const implicit = '/implicit';
  static const animList = '/anim_list';

  static final routes = [
    GetPage(name: hero, page: () => const HeroPage()),
    GetPage(name: implicit, page: () => const ImplicitAnimaPage()),
    GetPage(name: animList, page: () => const AnimatedListPage())
  ];
}
