import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/pages/day06_flex_layout/flex_layout_page.dart';
import 'package:flutter_demo/pages/day07_list_grid/day_07_demo.dart';
import 'package:flutter_demo/pages/day08_custom_widgets/custom_widget_demo_page.dart';
import 'package:flutter_demo/pages/day09_stack_card/stack_card_page.dart';
import 'package:flutter_demo/pages/day10_grid_cards/grid_cards_page.dart';
import 'package:flutter_demo/pages/day11_custom_button/custom_button_demo_page.dart';
import 'package:flutter_demo/pages/day13_card_demo/card_demo_page.dart';
import 'package:flutter_demo/pages/day14_widgets_demo/WidgetLibraryDemoPage.dart';
import 'package:flutter_demo/pages/day15_counter/counter_page.dart';
import 'package:flutter_demo/pages/day16_getx_counter/getx_counter_page.dart';
import 'package:flutter_demo/pages/day17_lifecycle_shared/main_counter_page.dart';
import 'package:flutter_demo/pages/day18_article_list/article_list_page.dart';
import 'package:flutter_demo/pages/day19_shared_refresh/article_list_page.dart';
import 'package:flutter_demo/pages/day20_article_app/article_list_page.dart';
import 'package:flutter_demo/pages/day21_dio_demo/post_list_page.dart';
import 'package:flutter_demo/pages/day22_api_wrapper/user_page.dart';
import 'package:flutter_demo/pages/day23_form_submit/feedback_page.dart';
import 'package:flutter_demo/pages/day24_upload/image_upload_page.dart';
import 'package:flutter_demo/pages/day25_paging/paging_page.dart';
import 'package:flutter_demo/pages/day_34_storage/storage_page.dart';
import 'package:flutter_demo/theme/button_theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'demo/MyDesktopScaffold.dart';
import 'demo/NavigationRailDemo.dart';
import 'demo/serious_python_demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 设置只支持竖屏（上下）
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home pages of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Builder(builder: (context) {
        return Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return StoragePage();
                    }));
                  },
                  text: "Day 34 - 本地存储"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return PagingPage();
                    }));
                  },
                  text: "Day 25 - 分页加载列表"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ImageUploadPage();
                    }));
                  },
                  text: "Day 24 - 图片上传"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return FeedbackPage();
                    }));
                  },
                  text: "Day 23 - 意见反馈"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return UserPage();
                    }));
                  },
                  text: "Day 22 - 用户列表"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    SeriousPythonDemo.runDemo();
                  },
                  text: "SeriousPythonDemo - Serious Python 演示"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return PostListPage();
                    }));
                  },
                  text: "Day 21 - 网络请求演示"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ArticleListPage3();
                    }));
                  },
                  text: "Day 20  - 图文管理 Demo（卡片列表 + 编辑详情页"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ArticleListPage2();
                    }));
                  },
                  text: "Day 19 - 页面共享状态 + 页面间刷新联动（GetX 实战）"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ArticleListPage();
                    }));
                  },
                  text: "Day 18 - 下拉刷新"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return MainCounterPage();
                    }));
                  },
                  text: "Day 17 - GetX计数器-共享"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return GetXCounterPage();
                    }));
                  },
                  text: "Day 16 - GetX计数器"),
              SizedBox(height: 12),
              CustomButtonTheme.createButton(() {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FlexLayoutPage();
                }));
              }, text: "Day 6 - 弹性布局（Expanded & Flexible）"),
              SizedBox(height: 12),
              CustomButtonTheme.createButton(() {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Day07DemoPage();
                }));
              }, text: "Day 7 学习主题：ListView & GridView"),
              SizedBox(height: 12),
              CustomButtonTheme.createButton(() {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return CustomWidgetDemoPage();
                }));
              }, text: "Day 8 学习主题：自定义组件"),
              SizedBox(height: 12),
              CustomButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return StackCardPage();
                  }));
                },
                text: 'Day 9 - 综合布局练习：Stack + Card + 图文混排',
              ),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return GridCardsPage();
                    }));
                  },
                  text: "Day 10 - 综合练习：构建图文宫格页面（GridView + 自定义卡片)"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CustomButtonDemoPage();
                    }));
                  },
                  text: "Day 11：封装通用按钮组件（CustomButton）"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CustomButtonDemoPage();
                    }));
                  },
                  text: "Day 12 - 标题与区块组件"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CardDemoPage();
                    }));
                  },
                  text: "Day 13 - 图文卡片封装"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return WidgetLibraryDemoPage();
                    }));
                  },
                  text: "Day 14 -组件库演示"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CounterPage();
                    }));
                  },
                  text: "Day 15：状态管理入门"),
              SizedBox(height: 12),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return NavigationRailDemo();
                    }));
                  },
                  text: "NavigationRail 的作用与典型场景"),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
