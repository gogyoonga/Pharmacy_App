import 'package:flutter/material.dart';

import 'navbar_items.dart';
import 'tab_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, 
    required this.currentTab, 
    required this.onSelectTab, 
    required List<TabItem> items});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
 
  @override
  Widget build(BuildContext context) {
    const Column(children: [SizedBox(width:1080 ,height:1920
    )],);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.main),
        _buildItem(TabItem.map),
        _buildItem(TabItem.info),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: Colors.amber,
    );
  }
 
  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return navbarItems[tabIdx[tabItem]!];
  }
}