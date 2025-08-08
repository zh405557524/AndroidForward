import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_card.dart';

class GridCardsPage extends StatelessWidget {
  const GridCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = List.generate(
        12,
        (index) => {
              'title': '图文项$index',
              'image': 'https://picsum.photos/200/200?random=$index',
            });

    return Scaffold(
      appBar: AppBar(title: const Text('Day 10 -图文宫格页面')),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
              crossAxisCount: 2,
              //每行两个
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 4,
              //狂高比，影响卡片形状
              children: data
                  .map((item) => ImageCard(
                      title: item['title']!, imageUrl: item['image']!))
                  .toList())),
    );
  }
}
