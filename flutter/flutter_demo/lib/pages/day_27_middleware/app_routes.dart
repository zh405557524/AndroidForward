import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day_27_middleware/login_page.dart';
import 'package:flutter_demo/pages/day_27_middleware/profile_page.dart';
import 'package:get/get.dart';

import 'home_page.dart';


class AppRoutes {
  static const home = '/home';
  static const profile = '/profile';
  static const login = '/login';

  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: profile, page: () => const ProfilePage(), middlewares: [RouteAuthMiddleware()]),
    GetPage(name: login, page: () => const LoginPage())
  ];
}

///路由权限中间件(需登录验证)
class RouteAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final bool isLoggedIn = AuthService.isLoggedIn;
    if (!isLoggedIn) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}

class AuthService {
  static bool isLoggedIn = false;

  static void login() => isLoggedIn = true;

  static void logout() => isLoggedIn = false;
}
