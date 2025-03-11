import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      "/": (_) {//默认首页 路由地址,
        return MainPageDetail();
      },
      "/page2": (context) => Page2()
    }, title: "第一个页面",
        // home: MainPageDetail()//如果有默认首页，就不需要home
    );
  }
}

class MainPageDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () async {
                // Lance lance = await
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //   return Page2();
                // }));
                Navigator.pushNamed(context, "/page2");
                // print("lance:${lance.name}");
              },
              child: Text("跳转到第二个页面")),
        ],
      ),
    );
  }
}

class Lance {
  late String name;
  late int age;

  Lance({required this.name, required this.age});
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                ///返回数据给上一个见面
                Navigator.pop(context, Lance(name: "soul", age: 12));
              },
              child: Text("跳转到第一个页面")),
        ],
      ),
    );
  }
}
