import 'package:logger/logger.dart';

class LogUtil {
  static var logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      // 控制打印方法的数量
      errorMethodCount: 5,
      // 错误日志的打印方法数
      lineLength: 80,
      // 控制每行的字符长度
      colors: true,
      // 启用颜色
      printEmojis: false,
      // 显示emoji
      printTime: true, // 打印日志时间
    ),
  );

  // 打印不同级别的日志
  static void v(String tag, String msg) {
    logger.v('$tag: $msg');
  }

  static void d(String tag, String msg) {
    logger.d('$tag: $msg');
  }

  static void i(String tag, String msg) {
    logger.i('$tag: $msg');
  }

  static void w(String tag, String msg) {
    logger.w('$tag: $msg');
  }

  static void e(String tag, String msg) {
    logger.e('$tag: $msg');
  }
}

void main() {
  // 使用日志方法时，第一个参数为 tag
  LogUtil.v("MainActivity", "This is a verbose log");
  LogUtil.d("MainActivity", "This is a debug log");
  LogUtil.i("MainActivity", "This is an info log");
  LogUtil.w("MainActivity", "This is a warning log");
  LogUtil.e("MainActivity", "This is an error log");
}
