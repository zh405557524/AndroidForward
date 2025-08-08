import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'modules/home/home_page.dart';
import 'modules/profile/profile_page.dart';
import 'modules/settings/settings_page.dart';
class AppRoutes {
  static const home = '/home';
  static const profile = '/profile';
  static const settings = '/settings';
  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: profile, page: () => const ProfilePage()),
    GetPage(name: settings, page: () => const SettingPage()),
  ];

}
