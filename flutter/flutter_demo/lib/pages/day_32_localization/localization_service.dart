import 'dart:ui';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class LocalizationService extends Translations {

  static final fallbackLocal = const Locale('zh', 'CN');

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'title': '多语言演示',
          'hello': '你好',
          'switch': '切换语言',
        },
        'en_US': {
          'title': 'Localization Demo',
          'hello': 'Hello',
          'switch': 'Switch Language',
        },
      };
}
