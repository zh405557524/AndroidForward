import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/theme/button_theme.dart';

import 'controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _registerPageState();
}

class _registerPageState extends State<RegisterPage> {
  var registerController = RegisterController(); // 控制器

  @override
  void initState() {
    super.initState();
    registerController.onRegisterSuccess = (success, msg) {
      if (success) {
        ///注册成功后跳转到登录页面
        Navigator.of(context).pop(); // 关闭注册页面
      }
    };
  }

  @override
  void dispose() {
    super.dispose();
    registerController.onRegisterSuccess = null; // 清空回调，防止内存泄漏
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ), // 上边距
              _buildUserName(),
              _buildUserPassword(),
              _buildUserPassword2(),
              SizedBox(
                height: 10,
              ),
              _buildRegisterButton(),
            ],
          ),
        );
      }),
    );
  }

  startToText(BuildContext context) {}

  _buildUserName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "用户名",
          hintText: "请输入用户名",
        ),
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // 可以做一些操作
          FocusScope.of(context).nextFocus();
        },
        onChanged: (value) {
          registerController.username = value.trim(); // 实时更新用户名到控制器
        },
        validator: (String? value) {
          if (value == null) {
            // null 的情况
            return "用户名不能为空";
          }

          if (value.trim().isEmpty) {
            // 错误提示
            return "用户名不能为空";
          }
          if (value.trim().length < 3) {
            return "用户名长度不能小于3";
          }
          registerController.username = value.trim(); // 设置用户名到控制器
          return null; // 校验通过
        },
      ),
    );
  }

  _buildUserPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "密码",
          hintText: "请输入密码",
        ),
        obscureText: true,
        // 密码不可见
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          // 实时更新密码到控制器
          registerController.password = value.trim();
        },
        onEditingComplete: () {
          // 可以做一些操作
          FocusScope.of(context).nextFocus();
        },
        validator: (String? value) {
          registerController.password = value?.trim(); // 设置密码到控制器
          if (value == null || value.trim().isEmpty) {
            return "密码不能为空";
          }
          if (value.trim().length < 6) {
            return "密码长度不能小于6";
          }
          return null; // 校验通过
        },
      ),
    );
  }

  _buildUserPassword2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "确认密码",
          hintText: "请再次输入密码",
        ),
        obscureText: true,
        // 密码不可见
        textInputAction: TextInputAction.done,
        onEditingComplete: () {
          // 可以做一些操作
          FocusScope.of(context).unfocus(); // 收起键盘
        },
        onChanged: (value) {
          // 实时更新确认密码到控制器
          registerController.confirmPassword = value.trim(); // 设置确认密码到控制器
        },
        validator: (String? value) {
          registerController.confirmPassword = value?.trim(); // 设置确认密码到控制器
          if (value == null || value.trim().isEmpty) {
            return "请再次输入密码";
          }
          if (value != (context as dynamic)._buildUserPassword().toString()) {
            return "两次密码输入不一致";
          }
          return null; // 校验通过
        },
      ),
    );
  }

  _buildRegisterButton() {
    return CustomButtonTheme.createButton(
      () {
        registerController.register();
      },
      text: "注册",
    );
  }
}
