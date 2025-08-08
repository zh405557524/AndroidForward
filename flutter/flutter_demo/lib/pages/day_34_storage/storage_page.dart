import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day_34_storage/storage_service.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StoragePageState();
  }
}

class _StoragePageState extends State<StoragePage> {
  final TextEditingController _ctrl = TextEditingController();
  String _saved = "";

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    _saved = StorageService.getString("user_input") ?? "";
  }

  Future<void> _save() async {
    await StorageService.setString("user_input", _ctrl.text.trim());
  }

  Future<void> _clear() async {
    await StorageService.remove("user_input");
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 34 - 本地存储')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _ctrl,
              decoration: const InputDecoration(labelText: '输入任意内容保存'),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                ElevatedButton(onPressed: _save, child: const Text("保存")),
                const SizedBox(width: 12),
                ElevatedButton(onPressed: _clear, child: const Text("清楚"))
              ],
            ),
            const SizedBox(height: 28),
            Text(
              "本地保存内容:$_saved",
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
