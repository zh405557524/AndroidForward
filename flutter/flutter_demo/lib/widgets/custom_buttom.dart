import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 自定义按钮组件
/// 可以传入标题、背景色、文字色、点击事件
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.backgroundColor = Colors.blue,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
