import 'package:flutter/material.dart';
import 'package:movies_app/core/navigation_bar/tab_item.dart';

class BottomNavBar extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  const BottomNavBar(
      {Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      backgroundColor: Colors.grey.shade900.withOpacity(0.8),
      items: [
        _buildItem(TabItem.movies,const Icon(Icons.movie)),
        _buildItem(TabItem.categories,const Icon(Icons.category)),
        _buildItem(TabItem.search, const Icon(Icons.search)),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
    );
  }
  BottomNavigationBarItem _buildItem(TabItem tabItem,Icon icon) {
    return BottomNavigationBarItem(
      icon: icon,
      label: tabItem.name,
    );
  }
}
