import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_card.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (index) => "列表项 $index");

    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView 示例'),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ItemCard(title: items[index]);
            }));
  }
}
