import 'package:flutter/material.dart';

class NavigationRailDemo extends StatefulWidget {
  const NavigationRailDemo({Key? key}) : super(key: key);

  @override
  State<NavigationRailDemo> createState() => _NavigationRailDemoState();
}

class _NavigationRailDemoState extends State<NavigationRailDemo> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected, // 可选：all/selected/none
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                selectedIcon: Icon(Icons.home_filled),
                label: Text('主页'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                selectedIcon: Icon(Icons.settings_applications),
                label: Text('设置'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.info),
                label: Text('关于'),
              ),
            ],
          ),
          // 内容区域
          Expanded(
            child: Center(
              child: Text('当前页面：${_selectedIndex + 1}'),
            ),
          ),
        ],
      ),
    );
  }
}
