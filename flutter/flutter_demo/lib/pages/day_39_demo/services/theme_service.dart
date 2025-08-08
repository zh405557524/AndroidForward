import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';

import '../app_theme.dart';

class ThemeService extends GetxService {
  static final _box = GetStorage();
  static final _key = 'isDarkMode';

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => _box.read(_key) ?? false;

  Future<void> switchTheme() async {
    final isDark = !_loadTheme();
    await _box.write(_key, isDark);
    Get.changeTheme(isDark ? AppTheme.dark : AppTheme.light);
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
