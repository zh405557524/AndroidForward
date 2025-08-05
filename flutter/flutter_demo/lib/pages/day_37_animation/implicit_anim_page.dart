import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImplicitAnimaPage extends StatefulWidget {
  const ImplicitAnimaPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImplicitAnimaPageState();
  }
}

class _ImplicitAnimaPageState extends State<ImplicitAnimaPage> {
  double size = 100;
  Color color = Colors.blue;

  void _animate() {
    setState(() {
      size = size == 100 ? 180 : 100;
      color = color == Colors.blue ? Colors.orange : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('隐式动画要演示')),
      body: Center(
        child: GestureDetector(
          onTap: _animate,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text('点击变换', style: TextStyle(color: Colors.white, fontSize: 22)),
            ),
          ),
        ),
      ),
    );
  }
}
