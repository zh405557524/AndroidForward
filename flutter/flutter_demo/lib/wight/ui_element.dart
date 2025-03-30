import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UIElementWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _uiElementState();
}

class _uiElementState extends State<UIElementWidget> {
  _uiElementState() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () => onPressend("文本"), child: Text("文本显示"))
      ],
    ));
  }

  void onPressend(intent) {
    switch (intent) {
      case "文本":
        {
          print("文本");
        }

    }
  }
}
