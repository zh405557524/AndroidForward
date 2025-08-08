import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_buttom.dart';
import '../../widgets/section_title.dart';

class CustomWidgetDemoPage extends StatelessWidget {
  const CustomWidgetDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Day 8 学习主题：自定义组件")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            CustomButton(
              text: "自定义按钮",
              onPressed: () => {},
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
            SectionTitle(title: "标题")
          ],
        ),
      ),
    );
  }
}
