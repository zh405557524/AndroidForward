import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day06_flex_layout/flex_layout_card.dart';

///	展示 Row / Column + Expanded / Flexible 的示例
class FlexLayoutPage extends StatelessWidget {
  const FlexLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex 布局示例"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(width: 50, height: 50, color: Colors.red),
              Expanded(
                //对剩余空间进行分配
                child: Container(
                  height: 50,
                  color: Colors.blue,
                ),
              ),
              Flexible(
                //占据剩余空间的比例
                flex: 2, //表示占据2份的空间
                child: Container(height: 50, color: Colors.green),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("卡片布局示例"),
          ),
          const FlexLayoutCard(),
        ],
      ),
    );
  }
}
