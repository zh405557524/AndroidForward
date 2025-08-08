import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_theme.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<StatefulWidget> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 31 - 主题演示')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('当前主题:${_isDark ? '深色' : '浅色'}', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isDark = !_isDark;
                  });
                  Get.changeTheme(_isDark ? AppTheme.darkTheme : AppTheme.lightTheme);
                },
                child: Text(
                  'AppBar/按钮/字体都会随主题切换',
                  style: Theme.of(context).textTheme.bodyMedium,
                ))
          ],
        ),
      ),
    );
  }
}
