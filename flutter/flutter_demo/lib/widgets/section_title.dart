import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///标题组件，统一样式，提升一致性
class SectionTitle extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry padding;

  const SectionTitle(
      {super.key,
      required this.title,
      this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12)});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:padding,
        child: Text(title, style: Theme.of(context).textTheme.titleLarge));
  }
}
