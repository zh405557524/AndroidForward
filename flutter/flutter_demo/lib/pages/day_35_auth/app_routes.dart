import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'auth_service.dart';
import 'home_page.dart';
import 'login_page.dart';

class AppRoutes {
  static const home = '/home';
  static const login = '/login';
  static final routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(name: login, page: () => LoginPage())
  ];
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!AuthService.isLoggedIn) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
