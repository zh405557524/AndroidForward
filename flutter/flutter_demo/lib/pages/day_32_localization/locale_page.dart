import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalePage extends StatelessWidget {
  const LocalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title'.tr)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                final now = Get.locale?.languageCode;
                //切换语言
                if (now == 'zh') {
                  Get.updateLocale(const Locale('en', 'US'));
                } else {
                  Get.updateLocale(const Locale('zh', 'CN'));
                }
              },
              child: Text('switch'.tr),
            )
          ],
        ),
      ),
    );
  }
}
