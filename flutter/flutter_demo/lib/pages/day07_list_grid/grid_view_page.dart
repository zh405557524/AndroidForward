import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_card.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (index) => "网格项 $index");
    return Scaffold(
        appBar: AppBar(title: const Text("GridView 示例")),
        body: GridView.count(
            crossAxisCount: 2,
            // 每行显示2个网格
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            padding: const EdgeInsets.all(8),
            children: items.map((title) => ItemCard(title: title)).toList()));
  }
}
