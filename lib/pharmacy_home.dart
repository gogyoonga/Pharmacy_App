import 'package:drug_app/google_map_screen.dart';
import 'package:drug_app/warning.dart';
import 'package:flutter/material.dart';
import 'pharmacy_main.dart';
/// Flutter code sample for [NavigationBar].

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Commute',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
      ),
      body:SingleChildScrollView(
          scrollDirection: Axis.vertical, child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            Text('Label behavior: ${labelBehavior.name}'),
          
            OverflowBar(
              spacing: 10.0,
              children: <Widget>[
               PharmacyMain(),
               PharmacySearch(),
               Warning(),
               
               
                
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
