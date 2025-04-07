import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  /// 静态方法，显示Toast
  static void show(String? msg, {int duration = 2, int gravity = 1}) {
    if (msg == null) {
      return;
    }
    try {
      Fluttertoast.showToast(
          msg: msg,
          toastLength: duration == 2 ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
          gravity: gravity == 0 ? ToastGravity.CENTER : ToastGravity.BOTTOM,
          backgroundColor: Colors.black87,
          //背景颜色
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      print(e);
    }
  }
}
