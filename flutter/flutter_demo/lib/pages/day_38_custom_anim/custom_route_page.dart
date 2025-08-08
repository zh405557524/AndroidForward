import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRoutePage extends StatelessWidget {
  const CustomRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('自定义页面转场')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(_buildRoute());
            },
            child: const Text('跳转到新页面(滑入动画)')),
      ),
    );
  }

  Route _buildRoute() {
    return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const NewPage(),
        transitionsBuilder: (context, anim, secAnim, child) {
          const begin = Offset(1, 0);
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
          var offsetAnim = anim.drive(tween);

          return SlideTransition(position: offsetAnim, child: child);
        });
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('新页面')),
      body: const Center(
        child: Text('自定义转成完成!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
