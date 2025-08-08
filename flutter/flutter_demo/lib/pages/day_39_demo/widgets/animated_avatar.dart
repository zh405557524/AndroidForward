import 'package:flutter/cupertino.dart';

class AnimatedAvatar extends StatefulWidget {
  AnimatedAvatar({super.key});

  @override
  State<AnimatedAvatar> createState() {
    return _AnimatedAvatarState();
  }
}

class _AnimatedAvatarState extends State<AnimatedAvatar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _scaleAnim = Tween<double>(begin: 1, end: 1.4)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "avatar",
      child: ScaleTransition(
        scale: _scaleAnim,
        child: ClipOval(
            child:
                Image.network("https://i.pravatar.cc/120?img=6", width: 80, height: 80, fit: BoxFit.cover)),
      ),
    );
  }
}
