import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/uielement/text_page.dart';

import 'button_page.dart';

///UI 组件展示
class UIElementWight extends StatefulWidget {
  const UIElementWight({super.key});

  @override
  State<StatefulWidget> createState() {
    return _uiElementWightState();
  }
}

///ui 组件状态类 包括 text、button、image、TextFile、Checkbox、Radio、CircularProgressIndicator
class _uiElementWightState extends State<UIElementWight> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("UIElement"),
          ),
          body: Builder(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: () => {startToText(context, TextPage())}, child: Text("Text")),
                TextButton(onPressed: () => {startToText(context, ButtonPage())}, child: Text("Button")),
              ],
            );
          })),
    );
  }

  void startToText(context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
