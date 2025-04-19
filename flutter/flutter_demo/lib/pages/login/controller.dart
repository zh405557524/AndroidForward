import 'package:flutter_demo/utils/log_utils.dart';
import 'package:flutter_demo/utils/toast_util.dart';

import '../../other/http/Api.dart';

class LoginController {
  var username = "";

  String password = "";

  void Function(bool succeed, String message)? onLoginResult;

  login() async {
    LogUtil.i("TAG", "开始登录, username:$username, password:$password");
    if (username.isEmpty || password.isEmpty) {
      ToastUtil.show("用户名或密码不能为空");
      LogUtil.e("TAG", "登录失败: 用户名或密码不能为空");
      onLoginResult?.call(false, "用户名或密码不能为空"); // 回调登录结果，失败
      return;
    }
    var data = await Api.login(username, password);

    if (data == null) {
      ToastUtil.show("登录失败，请稍后再试");
      LogUtil.e("TAG", "登录失败: 返回数据为空");
      onLoginResult?.call(false, "登录失败，请稍后再试"); // 回调登录结果，失败
      return;
    }
    if (data['errorCode'] == 0) {
      ///登录成功
      LogUtil.i("TAG", "登录成功: ${data.toString()}");
      ToastUtil.show("登录成功");
      onLoginResult?.call(true, "登录成功"); // 回调登录结果，成功
      return;
    } else {
      ///登录失败
      LogUtil.e("TAG", "登录失败: ${data['errorMsg']}");
      ToastUtil.show(data['errorMsg'] ?? "登录失败，请稍后再试");
      onLoginResult?.call(false, data['errorMsg'] ?? "登录失败，请稍后再试"); // 回调登录结果，失败
      return;
    }
  }
}
