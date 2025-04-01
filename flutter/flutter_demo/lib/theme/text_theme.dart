import 'package:flutter/cupertino.dart';

import 'color_style.dart';

class CustomTextTheme {
  static textView(String text,
      {double fontSize = 14,
      Color? color,
      TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? ColorTheme.gray_dark,
      ),
      textAlign: textAlign,
    );
  }

  static Text gary_sp14(text) {
    return textView(text, fontSize: 14, color: ColorTheme.gray);
  }

  static Text gary_sp16(text) {
    return textView(text, fontSize: 16, color: ColorTheme.gray);
  }

  static Text gary_sp18(text) {
    return textView(text, fontSize: 18, color: ColorTheme.gray);
  }
}
