import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 图文宫格卡片组件

class ImageCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ImageCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            //顶部图片
            Expanded(child: Image.network(imageUrl, width: double.infinity, fit: BoxFit.cover)), //底部标题
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            )
          ],
        ));
  }
}
