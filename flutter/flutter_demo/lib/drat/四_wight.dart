import 'package:flutter/material.dart';

main() => runApp(myAPP());

class myAPP extends StatefulWidget {
  const myAPP({super.key});

  @override
  State<myAPP> createState() => _myAPPState();
}

class _myAPPState extends State<myAPP> {
  String data = "soul_12";

  _myAPPState() {
    data = "soul_13";
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        data = "soul_12.com";
      });
    });
  }

  /// 第一次进入界面，只执行一次 类似onCreate 方法。
  @override
  void initState() {
    super.initState();
    print("initState");
  }

  /// 初始化，在initState()之后调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("soul_12")),
            body: Center(child: Text(data, textDirection: TextDirection.ltr))));
  }

  ///界面停止
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  ///界面销毁
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }
}
