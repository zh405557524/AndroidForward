import 'package:get/get.dart';
import 'locale_page.dart';

class AppRoutes {
  static const locale = '/locale';

  static final routes = [GetPage(name: locale, page: () => const LocalePage())];
}
