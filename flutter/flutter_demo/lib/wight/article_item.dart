import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {

  final itemData;

  ArticleItem(this.itemData);

  @override
  Widget build(BuildContext context) {
    Row author = new Row(
      children: <Widget>[
        new Expanded(child:
        Text.rich(TextSpan(children: [
          TextSpan(text: "作者"),
          TextSpan(
            text: itemData['author'],
            style: new TextStyle(
                color: Theme
                    .of(context)
                    .primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
          )
        ]
        ))
        ),
        new Text(itemData['niceDate']) //时间
      ],
    );

    //标题
    Text title = new Text(itemData['title'],
      style: new TextStyle(
          fontSize: 16.0,
          color: Colors.black
      ),
      textAlign: TextAlign.left,
    );

    //章节名
    Text chapterName = new Text(itemData['chapterName'],
        style: new TextStyle(color: Theme
            .of(context)
            .primaryColor)
    );

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start, //子控件左对齐
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10.0), child: author),
        Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0), child: title),
        Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: chapterName),
      ],
    );

    return new Card(elevation: 4.0, child: column);
  }


}
