import 'package:flutter/material.dart';

class CustomButtonTheme {
  static createButton(
    VoidCallback? onPressed, {
    text,
    double paddingLeft = 10,
    double paddingRight = 10,
    double height = 48, //默认高度
    double fontSize = 14, //默认字体大小
  }) {
    return Container(
      padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
      width: double.infinity,
      height: height,
      child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          )),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double paddingLeft;
  final double paddingRight;
  final double height; //默认高度
  final double fontSize;

  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.paddingLeft = 10,
      this.paddingRight = 10,
      this.height = 48,
      this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
      width: double.infinity,
      height: height,
      child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          )),
    );
  }
}
