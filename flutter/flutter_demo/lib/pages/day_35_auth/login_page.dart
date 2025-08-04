import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';
import 'auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: ctrl, decoration: const InputDecoration(labelText: '输入任意 Token')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    if (ctrl.text.isNotEmpty) {
                      await AuthService.login(ctrl.text.trim());
                      Get.offAllNamed(AppRoutes.home);
                    }
                  },
                  child: const Text('登录'))
            ],
          ),
        ),
      ),
    );
  }
}
