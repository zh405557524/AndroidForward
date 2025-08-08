import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/log_utils.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
      children: [
        ElevatedButton(onPressed: () => {LogUtil.i("tag", "click1")}, child: Text("Elevated Button")),
        TextButton(onPressed: () => {LogUtil.i("TAG", "click2")}, child: Text("Text Button"))
      ],
    ));
  }
}
