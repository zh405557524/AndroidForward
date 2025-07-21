import 'package:flutter_demo/pages/day_26_routes/profile_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'home_page.dart';

class AppRoutes {
  static const home = '/home';
  static const profile = '/profile';

  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: profile, page: () => const ProfilePage())
  ];
}
