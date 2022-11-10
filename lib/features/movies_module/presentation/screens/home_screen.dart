import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/components.dart';
import '../../../../core/navigation_bar/bottom_nav_bar.dart';
import '../../../../core/navigation_bar/tab_item.dart';
import '../../../../core/navigation_bar/tab_navigator.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime timeBackPressed = DateTime.now();

  var visible = true;
  var _currentTab = TabItem.movies;

  final _navigatorKeys = {
    TabItem.movies: GlobalKey<NavigatorState>(),
    TabItem.categories: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab ) {
      // pop to first route
      setState(() =>_currentTab = TabItem.movies);
      //_navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isCurrent);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }
  @override
  Widget build(BuildContext context) {
      return  WillPopScope(
        onWillPop:() async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= const Duration(seconds: 2);
          timeBackPressed = DateTime.now();
          if(isExitWarning){
            const String message = 'Press Back Again To Exit';
            showToast(text: message, type: ToastTypes.WARNING);

            return false;
          }else{
            Fluttertoast.cancel();
            return true;
          }
        },

        child: Scaffold(
            extendBody: true,
            body: Stack(
              children: [
                _buildOffstageNavigator(TabItem.movies),
                _buildOffstageNavigator(TabItem.categories),
                _buildOffstageNavigator(TabItem.search),
              ],
            ),
            bottomNavigationBar: AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              height: visible ? kBottomNavigationBarHeight : 0,
              child: Wrap(
                children: [
                  BottomNavBar(
                      currentTab: _currentTab, onSelectTab: _selectTab),
                ],
              ),
            ),

        ),
      );
  }
  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
        hideNav: hideNav,
        showNav: showNav,

      ),
    );
  }
  void hideNav (){
    setState(() {
      visible =false;
    });
  }
  void showNav (){
    setState(() {
      visible =true;
    });
  }
}


/*

 */