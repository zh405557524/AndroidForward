import 'package:flutter/material.dart';
import 'package:flutter_demo/http/Api.dart';

import '../wight/article_item.dart';

main() => runApp(myAPP());

class myAPP extends StatefulWidget {
  //有状态的widget
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
            appBar: AppBar(title: Text("soul_12")), body: new ArticlePage()));
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

class ArticlePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ArticlePageState();
  }
}

class _ArticlePageState extends State<ArticlePage> {
  ScrollController _controller = ScrollController();

  bool _isHide = true;

  ///请求到的文章数据
  List articles = [];

  ///请求到的banner数据
  List banners = [];

  ///总页数
  var totalCount = 0;

  ///当前页数
  var curPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      //上拉加载监听
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && curPage < totalCount) {
        // _getArticleList();
      }
    });
    _pullToRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Offstage(
          offstage: _isHide, //是否隐藏
          child: new Center(child: CircularProgressIndicator()) //上拉加载
          ),
      //内容
      Offstage(
        offstage: !_isHide,
        child: new RefreshIndicator(
            onRefresh: _pullToRefresh,
            child: ListView.builder(
              itemCount: articles.length + 1,
              itemBuilder: (context, i) => _buildItem(i),
              controller: _controller,
            )),
      )
    ]);
  }

  Future<void> _pullToRefresh() async {
    curPage = 0;
    Iterable<Future> futures = [_getArticleList(false), _getBanner()];
    await Future.wait(futures);
    _isHide = false;
    print("_isHide:${_isHide}");
    setState(() {});
    return null;
  }

  _getArticleList([bool update = true]) async {
    print("_getArticleList");
    var data = await Api.getArticleList(curPage);
    if (data != null) {
      var map = data['data'];
      var datas = map['datas'];

      totalCount = map["pageCount"];
      if (curPage == 0) {
        articles.clear();
      }
      curPage++;
      articles.addAll(datas);
      print("datas:${datas.toString()}");
      if (update) {
        setState(() {});
      }
    }
  }

  _getBanner([bool update = true]) async {
    var data = await Api.getBanner();
    if (data != null) {
      banners = data['data'];
      if (update) {
        setState(() {});
      }
    }
  }

  Widget _buildItem(int i) {
    if (i == 0) {
      return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          // child: _bannerView(),
          child: Text("data", textDirection: TextDirection.ltr) //banner,
          );
    }
    var itemData = articles[i - 1];
    return ArticleItem(itemData);
  }

  _bannerView() {
    List<Widget> list = banners.map((item) {
      return Image.network(item['imagePath'], fit: BoxFit.cover);
    }).toList();

    return
        // list.isNotEmpty
        // ? BannerViewHelper.getBannerView(list,
        //     height: MediaQuery.of(context).size.height * 0.3,
        //     onPageChanged: (index) {
        //     print("onPageChanged:$index");
        //   }, onScrolled: (offset) {
        //     print("onScrolled:$offset");
        //   })
        null;
  }
}
