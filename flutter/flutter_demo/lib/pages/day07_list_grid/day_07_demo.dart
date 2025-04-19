import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'grid_view_page.dart';
import 'list_view_page.dart';

class Day07DemoPage extends StatelessWidget {
  const Day07DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Day07 Demo")),
      body:Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ListViewPage();
                }));
              },
              child: Text("ListView 示例"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return GridViewPage();
                }));
              },
              child: Text("GridView 示例"),
            ),

          ]
        ),
      )

    );
  }
}
