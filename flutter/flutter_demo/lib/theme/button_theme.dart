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
