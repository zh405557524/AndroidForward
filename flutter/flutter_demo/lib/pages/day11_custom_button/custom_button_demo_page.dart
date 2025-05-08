import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/custom_buttom.dart';

import '../../utils/toast_util.dart';

class CustomButtonDemoPage extends StatelessWidget {
  const CustomButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Day 11 - 自定义按钮组件'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const Text('默认按钮：'),
              const SizedBox(height: 12),
              CustomButton(
                text: '默认按钮',
                onPressed: () {
                  ToastUtil.show('默认按钮点击');
                },
              ),
              const SizedBox(height: 24),
              const Text('自定义颜色、圆角的按钮'),
              const SizedBox(height: 12),
              CustomButton(
                text: '绿色按钮',
                backgroundColor: Colors.green,
                textColor: Colors.white,
                borderRadius: 20,
                onPressed: () {
                  ToastUtil.show('绿色按钮点击');
                },
              )
            ])));
  }
}
