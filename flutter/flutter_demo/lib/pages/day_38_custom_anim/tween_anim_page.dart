import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenAnimaPage extends StatefulWidget {
  const TweenAnimaPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TweenAnimPageState();
  }
}

class _TweenAnimPageState extends State<TweenAnimaPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _sizeAnim = Tween<double>(begin: 100, end: 220)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
      appBar: AppBar(
        title: const Text('Tween 动画'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _play,
          child: AnimatedBuilder(
              animation: _sizeAnim,
              builder: (context, child) {
                return Container(
                    width: _sizeAnim.value,
                    height: _sizeAnim.value,
                    color: Colors.purple,
                    alignment: Alignment.center,
                    child: const Text('点击变换尺寸', style: TextStyle(color: Colors.white, fontSize: 18)));
              }),
        ),
      ),
    );
  }
}
