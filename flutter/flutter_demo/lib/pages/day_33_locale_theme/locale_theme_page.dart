import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_theme.dart';

class LocaleThemePage extends StatefulWidget {
  const LocaleThemePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LocaleThemePageState();
  }
}

class _LocaleThemePageState extends State<LocaleThemePage> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    String currentLang = Get.locale?.languageCode ?? 'zh';
    String currentTheme = _isDark ? 'Dark' : 'Light';
    return Scaffold(
      appBar: AppBar(title: Text("title".tr)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('hello'.tr, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          Text('${'current_theme'.tr} $currentTheme'.tr,
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _isDark = !_isDark;
                  Get.changeTheme(_isDark ? AppTheme.dark : AppTheme.light);
                });
              },
              child: Text('switch_theme'.tr)),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                if (currentLang == 'zh') {
                  Get.updateLocale(const Locale('en', "US"));
                } else {
                  Get.updateLocale(const Locale('zh', "CN"));
                }
                setState(() {});
              },
              child: Text('switch_lang'.tr))
        ]),
      ),
    );
  }
}
