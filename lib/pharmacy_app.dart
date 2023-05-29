import 'package:flutter/material.dart';
import 'package:drug_app/bottom_navigation.dart';
import 'package:drug_app/tab_item.dart';
import 'package:drug_app/pharmacy_search_screen.dart';
import 'package:drug_app/pharmacy_search.dart';

void main() {
  runApp(PharmacyApp());
}

class PharmacyApp extends StatefulWidget {
  const PharmacyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PharmacyAppState();
}

class PharmacyAppState extends State<PharmacyApp> {
  var _currentTab = TabItem.main;

  final _navigatorKeys = {
    TabItem.main: GlobalKey<NavigatorState>(),
    TabItem.map: GlobalKey<NavigatorState>(),
    TabItem.info: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacy App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await _navigatorKeys[_currentTab]!.currentState!.maybePop();

          if (isFirstRouteInCurrentTab) {
            if (_currentTab != TabItem.main) {
              _selectTab(TabItem.main);
              return false;
            }
          }

          return isFirstRouteInCurrentTab;
        },
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              _buildOffstageNavigator(TabItem.main),
              _buildOffstageNavigator(TabItem.map),
              _buildOffstageNavigator(TabItem.info),
            ],
          ),
          bottomNavigationBar: BottomNavigation(
            currentTab: _currentTab,
            onSelectTab: _selectTab,
            items: const [TabItem.main, TabItem.map, TabItem.info],
          ),
        ),
      ),
      routes: {
        '/pharmacy_search_screen': (context) => const PharmacySearchScreen(),
        '/pharmacy_search': (context) => const PharmacySearch(),
      },
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: Navigator(
        key: _navigatorKeys[tabItem],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => _getScreenForTab(tabItem),
          );
        },
      ),
    );
  }

  Widget _getScreenForTab(TabItem tabItem) {
  if (tabItem == TabItem.main) {
    return const PharmacySearchScreen();
  } else if (tabItem == TabItem.map) {
    return const PharmacySearch();
  } else if (tabItem == TabItem.info) {
    return Container(); // 원하는 화면 위젯으로 대체하세요
  }

  return Container(); // 기본적으로 Container 또는 다른 위젯을 반환합니다.
}

}
