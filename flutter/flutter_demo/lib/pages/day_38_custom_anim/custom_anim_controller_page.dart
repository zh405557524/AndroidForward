import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAnimaControllerPage extends StatefulWidget {
  const CustomAnimaControllerPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustomAnimaControllerPageState();
  }
}

class _CustomAnimaControllerPageState extends State<CustomAnimaControllerPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<Color?> _colorAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    _scaleAnim = Tween<double>(begin: 1, end: 1.6)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _colorAnim = ColorTween(begin: Colors.teal, end: Colors.deepOrange).animate(_controller);
  }

  void _play() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('自定义 AnimationController')),
      body: Center(
        child: GestureDetector(
          onTap: _play,
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnim.value,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _colorAnim.value,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Tap 动画',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
