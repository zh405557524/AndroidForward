import 'package:flutter_demo/pages/day_30_mini_app/modules/home/home_page.dart';
import 'package:flutter_demo/pages/day_30_mini_app/modules/profile/profile_binding.dart';
import 'package:flutter_demo/pages/day_30_mini_app/modules/profile/profile_page.dart';
import 'package:get/get.dart';

import 'modules/home/home_binding.dart';

class AppRoutes {
  static const home = '/home';
  static const profile = '/profile';

  static final routes = [
    GetPage(name: home, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(name: profile, page: () => const ProfilePage(), binding: ProfileBinding())
  ];
}
