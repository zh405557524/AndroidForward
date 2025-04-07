import 'package:flutter_demo/http/Api.dart';
import 'package:flutter_demo/utils/log_utils.dart';
import 'package:flutter_demo/utils/toast_util.dart';

class RegisterController {
  // Add your properties and methods here to handle the registration logic
  String username = '';
  String? password = '';
  String? confirmPassword = ''; // For confirming the password, if needed

  void Function(bool success, String msg)? onRegisterSuccess; // Callback for success

  void setUsername(String value) {
    username = value;
  }

  void setPassword(String value) {
    password = value;
  }

  void register() async {
    LogUtil.i("RegisterController", "开始注册, username:$username, password:$password");
    if (password == null || confirmPassword == null) {
      // Handle error: show a message to the user
      ToastUtil.show('密码不能为空');
      onRegisterSuccess?.call(false, '密码不能为空'); // Notify the caller about the failure
      return;
    }
    if (password != confirmPassword) {
      // Handle error: show a message to the user
      ToastUtil.show('两次密码输入不一致');
      onRegisterSuccess?.call(false, '两次密码输入不一致'); // Notify the caller about the failure
      return;
    }

    if (username.isEmpty || password!.isEmpty) {
      // Handle error: show a message to the user
      ToastUtil.show('用户名或密码不能为空');
      onRegisterSuccess?.call(false, '用户名或密码不能为空'); // Notify the caller about the failure
      return;
    }
    var data = await Api.register(username, password!);
    LogUtil.i("RegisterController", "注册返回结果: ${data.toString()}");
    if (data == null) {
      // Handle error: show a message to the user
      ToastUtil.show('注册失败，请稍后再试');
      onRegisterSuccess?.call(false, '注册失败，请稍后再试'); // Notify the caller about the failure
      return;
    }
    if (data['errorCode'] == 0) {
      // Registration successful
      ToastUtil.show('注册成功');
      onRegisterSuccess?.call(true, '注册成功'); // Notify the caller about the success
      return;
    } else {
      // Registration failed
      ToastUtil.show(data['errorMsg'] ?? '注册失败，请稍后再试');
      onRegisterSuccess?.call(false, data['errorMsg'] ?? '注册失败，请稍后再试'); // Notify the caller about the failure
      return;
    }
  }
}
