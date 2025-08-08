
import 'HttpManager.dart';

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

  static login(String username, String password) {
    var formData = {
      "username": username,
      "password": password,
    };
    return HttpManager.getInstance().request("user/login", params: formData, method: "post");
  }

  static register(String username, String password) {
    ///必须使用form表单提交
    var formData = {
      "username": username,
      "password": password,
      "repassword": password
    };
    return HttpManager.getInstance().request("user/register", params: formData, method: "post");
  }
}
