import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/animated_avatar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('个人中心'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AnimatedAvatar(),
            SizedBox(
              height: 16,
            ),
            Text(
              "昵称: 张三",
              style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text("邮箱:")
          ]),
        ));
  }
}
