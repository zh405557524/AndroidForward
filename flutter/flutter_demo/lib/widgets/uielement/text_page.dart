import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Text Page"),
          ),
          body: Column(
            children: [
              Text(
                "Hello, this is a text pages!",
                style: TextStyle(fontSize: 24, color: Colors.blue),
                textAlign: TextAlign.center, //对齐方式
                maxLines: 2,
                overflow: TextOverflow.ellipsis, //超出部分显示省略号
              ),
              SelectableText("This is a selectable text that can be copied!"),
              Text(
                "This is a long line of text that will automatically wrap when it reaches the edge of the screen.",
                softWrap: true,
                style: TextStyle(fontSize: 16),
              )
            ],
          )),
    );
  }
}
