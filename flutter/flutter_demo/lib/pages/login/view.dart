import 'package:flutter/material.dart';
import 'package:flutter_demo/theme/button_theme.dart';

import '../register/view.dart';
import 'controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage> {
  //登录控制器
  var loginController = LoginController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              _buildUserName(),
              _buildUserPassword(),
              SizedBox(
                height: 10,
              ),
              _buildLoginButton(),
              _buildRegister()
            ],
          ),
        );
      }),
    );
  }

  startToText(BuildContext context) {}

  _buildUserName() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: "用户名",
          hintText: "请输入用户名",
          prefixIcon: Icon(Icons.person),
        ),
        onChanged: (value) {
          loginController.username = value;
        },
      ),
    );
  }

  _buildUserPassword() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: "密码",
          hintText: "请输入密码",
          prefixIcon: Icon(Icons.lock),
        ),
        obscureText: true,
        onChanged: (value) {
          loginController.password = value;
        },
      ),
    );
  }

  _buildLoginButton() {
    return CustomButtonTheme.createButton(() {
      loginController.login();
    }, text: "登录");
  }

  _buildRegister() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('没有账号？'),
          GestureDetector(
            child: Text(
              '点击注册',
              style: TextStyle(color: Colors.green),
            ),
            onTap: () async {
              ///进入注册
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return RegisterPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
