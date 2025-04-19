import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///标题组件，统一样式，提升一致性
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge));
  }
}
