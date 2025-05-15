import 'package:flutter/material.dart';
import '../../widgets/image_card.dart';
import '../../widgets/info_card.dart';

/// Day 13 - 图文卡片封装演示页面
class CardDemoPage extends StatelessWidget {
  const CardDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 13 - 图文卡片封装')),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('ImageCard 示例：', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ImageCard(
            title: '清晨的街道',
            imageUrl: 'https://picsum.photos/id/1015/400/300',
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text('InfoCard 示例（横向）：', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          InfoCard(
            title: '今日新闻',
            subtitle: 'Flutter 3.22 发布，带来多个重大性能提升',
            imageUrl: 'https://picsum.photos/id/102/400/300',
            isHorizontal: true,
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text('InfoCard 示例（纵向）：', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          InfoCard(
            title: '推荐图文',
            subtitle: '这是一段副标题内容，可以介绍描述',
            imageUrl: 'https://picsum.photos/id/103/400/300',
            isHorizontal: false,
          ),
        ],
      ),
    );
  }
}
