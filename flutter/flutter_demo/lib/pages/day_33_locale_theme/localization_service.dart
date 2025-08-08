import 'dart:ui';

import 'package:get/get_navigation/src/root/internacionalization.dart';

class LocalizationService extends Translations {
  static final locales = [
    const Locale('zh', 'CN'),
    const Locale('en', "US"),
  ];

  static final fallbackLocale = const Locale('zh',"CN");

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'title': '主题与多语言',
          'hello': '你好，世界',
          'switch_lang': '切换语言',
          'switch_theme': '切换主题',
          'current_theme': '当前主题'
        },
        'en_US': {
          'title': 'Theme & Localization',
          'hello': 'Hello,World!',
          'switch_lang': 'Switch Language',
          'switch_theme': 'Switch Theme',
          'current_theme': 'Current Theme',
        }
      };
}
