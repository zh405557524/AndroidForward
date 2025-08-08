import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //默认首页 路由地址,
        "/": (context) => MainPageDetail(),
        "/page2": (context) => Page2()
      },
      title: "第一个页面",
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
      body: Builder(
        builder: (context) {
          return Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  startNavigator(context);
                },
                child: Text("跳转到第二个页面"),
              ),
            ],
          );
        },
      ),
    );
  }

  void startNavigator(context) {
    //跳转 添加动画
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return Page2();
    // }));

    // Navigator.pushNamed(context, "/page2");

    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(microseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return SlideTransition(
                ///Tween:在补间动画中，定义开始点结束点
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: Page2(),
              );
            }));
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
