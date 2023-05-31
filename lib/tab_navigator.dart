import 'package:flutter/material.dart';

import 'cold_drug_screen.dart';
import 'pharmacy_search.dart';
import 'pharmacy_search_screen.dart';
import 'tab_item.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}
 
class TabNavigator extends StatelessWidget {
  const TabNavigator({super.key, required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;
 
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
   Map<TabItem, Widget> tabScreen = {
  TabItem.main: const PharmacySearchScreen(),
  TabItem.map: const PharmacySearch(),
  TabItem.info: const ColdDrugScreen(),
};
    return {
      TabNavigatorRoutes.root: (context) => tabScreen[tabItem]!,
    };
  }
 
  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}