import 'package:get/get.dart';
import 'tween_anim_page.dart';
import 'custom_route_page.dart';
import 'custom_anim_controller_page.dart';

class AppRoutes {
  static const tween = '/tween';
  static const controller = '/controller';
  static const routeAnim = '/route_anim';

  static final routes = [
    GetPage(name: tween, page: () => const TweenAnimaPage()),
    GetPage(name: controller, page: () => const CustomAnimaControllerPage()),
    GetPage(name: routeAnim, page: () => const CustomRoutePage()),
  ];
}
