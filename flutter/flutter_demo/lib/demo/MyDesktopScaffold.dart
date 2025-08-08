import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDesktopScaffold extends StatelessWidget {
  const MyDesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 顶部栏
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.indigo],
            ),
            boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black12)],
          ),
          child: Row(
            children: [
              Icon(Icons.apps, color: Colors.white),
              SizedBox(width: 16),
              Text('我的桌面应用', style: TextStyle(color: Colors.white, fontSize: 22)),
              Spacer(),
              IconButton(icon: Icon(Icons.account_circle, color: Colors.white), onPressed: () {}),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              NavigationRail(
                selectedIndex: 0,
                onDestinationSelected: (_) {},
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('首页'),
                  ),
                ],
              ),
              Expanded(
                child: Center(child: Text('内容区')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
