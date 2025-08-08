import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day09_stack_card/article_card.dart';

class StackCardPage extends StatelessWidget {
  const StackCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 9 - Stack + Card')),
      body: ListView.builder(
          itemCount: 6,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            return ArticleCard(
              title: "文章标题$index",
              subtitle: "副标题信息，简要内容预览...",
              imageUrl: 'https://picsum.photos/400/200?random=$index',
            );
          }),
    );
  }
}
