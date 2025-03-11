import 'package:flutter_demo/http/HttpManager.dart';

class Api {
  static const String baseUrl = "http://www.wanandroid.com/";

  static const String ARTICLE_LIST = "article/list";

  static const String BANNER = "banner/json";

  static getArticleList(int page) {
    return HttpManager.getInstance().request("$ARTICLE_LIST/$page/json");
  }

  static getBanner() {
    return baseUrl + BANNER;
  }
}
