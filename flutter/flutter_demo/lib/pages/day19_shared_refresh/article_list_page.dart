import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/day19_shared_refresh/article_controller.dart';
import 'package:get/get.dart';
import 'article_detail_page.dart';


class ArticleListPage2 extends StatelessWidget{
  ArticleListPage2({super.key});

  final controller = Get.put(ArticleController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Day 19 - 文章列表')),
      body: Obx(()=>ListView.separated(
          itemCount:controller.articles.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder:(context,index){
            final article = controller.articles[index];
            return ListTile(
                title:Text(article.title),
                subtitle:Text(article.body),
                onTap:() async{
                  await Get.to(()=> ArticleDetailPage(),arguments:article);
                }
            );


          }

      )),

    );
  }

}
