import 'package:flutter/cupertino.dart';

///区块容器组件（可设置边框、圆角、内边距、背景色等）
class SectionBlock extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;

  const SectionBlock(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.all(16),
      this.backgroundColor = const Color(0xfff8f8f8),
      this.borderRadius = const BorderRadius.all(Radius.circular(12))});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ));
  }
}
