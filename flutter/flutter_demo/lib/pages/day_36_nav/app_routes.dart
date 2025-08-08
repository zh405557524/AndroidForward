import 'package:flutter_demo/pages/day_36_nav/settings_page.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class AppRoutes {
  static const home = '/home';
  static const profile = '/profile';
  static const settings = '/settings';

  static final routes = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: profile, page: () => ProfilePage()),
    GetPage(name: settings, page: () => SettingsPage()),
  ];
}
