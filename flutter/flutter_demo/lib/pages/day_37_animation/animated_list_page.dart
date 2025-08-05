import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedListPageState();
  }
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _items = <String>['A', "B", "C", "D"];

  void _addItem() {
    final next = String.fromCharCode(_items.last.codeUnitAt(0) + 1);
    _items.add(next);
    _listKey.currentState?.insertItem(_items.length - 1, duration: const Duration(milliseconds: 400));
    setState(() {});
  }

  void _removeItem(int index) {
    final removed = _items.removeAt(index);
    _listKey.currentState?.removeItem(
        index, (ctx, anim) => SizeTransition(sizeFactor: anim, child: ListTile(title: Text('移除：$removed'))),
        duration: const Duration(milliseconds: 400));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedList 列表动画')),
      body: AnimatedList(
          key: _listKey,
          initialItemCount: _items.length,
          itemBuilder: (ctx, i, anim) {
            return SizeTransition(
              sizeFactor: anim,
              child: ListTile(
                title: Text('字母:${_items[i]}'),
                trailing: IconButton(onPressed: () => _removeItem(i), icon: const Icon(Icons.delete)),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
