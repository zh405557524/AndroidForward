import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class WidgetLibraryDemoPage extends StatelessWidget {
  const WidgetLibraryDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Day 14 -组件库演示"),
        ),
        body: ListView(
          children: const [
            SectionTitle(title: "通用按钮"),
            Padding(
              padding: EdgeInsets.all(16),
              child: CustomButton(text: '点击我'),
            ),
            SectionTitle(title: '图文卡片'),
            ImageCard(
              title: '山间湖泊',
              imageUrl: 'https://picsum.photos/id/1016/400/300',
            ),
            SectionTitle(title: '信息卡片'),
            InfoCard(
                title: "Flutter 组件库实践",
                subtitle: "学习 Flutter 组件库的封装与使用",
                imageUrl: "https://picsum.photos/id/1018/400/300",
                isHorizontal: true)
          ],
        ));
  }
}
