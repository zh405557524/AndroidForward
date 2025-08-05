import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero 动画')),
      body: Center(
        child: GestureDetector(
          child: Hero(
              tag: 'avatar',
              child: ClipOval(
                child: Image.network(
                  'https://i.pravatar.cc/150?img=3',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              )),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const HeroDetailPage()),
            );
          },
        ),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('放大头像')),
      body: Center(
        child: Hero(
          tag: 'avatar',
          child: ClipOval(
            child:
                Image.network("https://i.pravatar.cc/300?img=3", width: 180, height: 180, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
