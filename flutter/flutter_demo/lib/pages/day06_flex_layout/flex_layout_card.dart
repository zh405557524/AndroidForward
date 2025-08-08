import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///练习封装一个横向图文卡片，使用 Flexible 控制宽度
class FlexLayoutCard extends StatelessWidget {
  const FlexLayoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      //白色背景
      color: Colors.white,
      //圆角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2,
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.image, size: 40)),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '这是一个使用Expanded 的横向卡片内容'
                      '文字可以自动换行并沾满剩余空间',
                      style: Theme.of(context).textTheme.bodyMedium)))
        ],
      ),
    );
  }
}
