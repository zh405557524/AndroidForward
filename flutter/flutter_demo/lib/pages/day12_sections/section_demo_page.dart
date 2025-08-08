import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/section_block.dart';
import 'package:flutter_demo/widgets/section_title.dart';

class SectionDemoPage extends StatelessWidget {
  const SectionDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 12 - 标题与区块组件')),
      body: ListView(children: const [
        SectionTitle(title: '今日推荐'),
        SectionBlock(child: Text('这位是一内容区块，可放置图文、按钮')),
        SectionTitle(title: "历史记录"),
        SectionBlock(child: Text('这是是历史记录模块内容'))
      ]),
    );
  }
}
