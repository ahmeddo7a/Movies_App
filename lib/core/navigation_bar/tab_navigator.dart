import 'package:flutter/material.dart';
import 'package:movies_app/core/navigation_bar/tab_item.dart';
import '../../features/movies_module/presentation/screens/layout/movie_categories_screen.dart';
import '../../features/movies_module/presentation/screens/layout/movie_search_screen.dart';
import '../../features/movies_module/presentation/screens/layout/movies_screen.dart';
import '../error_screen.dart';
class TabNavigatorRoutes {
  static const String rootMovies = '/';
  static const String rootCategories = '/categories';
  static const String rootSearch = '/search';
  static const String error = '/error';

}

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem,required this.showNav,required this.hideNav});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;
  final VoidCallback showNav;
  final VoidCallback hideNav;

  // 3
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.rootMovies: (context) =>  MoviesScreen(showNavigation: showNav,hideNavigation: hideNav),
      TabNavigatorRoutes.rootCategories: (context) =>  MoviesCategoriesScreen(showNavigation: showNav,hideNavigation: hideNav),
      TabNavigatorRoutes.rootSearch: (context) =>  MoviesSearchScreen(showNavigation:  showNav,hideNavigation: hideNav,),
      TabNavigatorRoutes.error: (context) => const ErrorScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    if(tabItem == TabItem.movies){
      return  Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.rootMovies,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name!]!(context),
          );
        },
      );
    }else if(tabItem == TabItem.categories){
      return  Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.rootCategories,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name!]!(context),
          );
        },
      );
    }else if(tabItem == TabItem.search) {
      return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.rootSearch,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name!]!(context),
          );
        },
      );
    }else{
      return  Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.error,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name!]!(context),
          );
        },
      );
    }
  }
}