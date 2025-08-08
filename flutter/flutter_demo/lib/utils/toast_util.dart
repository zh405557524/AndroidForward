import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

class ToastUtil {
  /// 静态方法，显示Toast
  static void show(BuildContext context, String? msg, {int duration = 2, int gravity = 1}) {
    if (msg == null) {
      return;
    }
    try {
      FlutterToastr.show(msg, context,
          duration: FlutterToastr.lengthShort, position: FlutterToastr.bottom);
    } catch (e) {
      print(e);
    }
  }
}
