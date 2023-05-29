
import 'package:flutter/material.dart';

import 'cold_drug_screen.dart';
import 'google_map_screen.dart';
import 'pharmacy_search_screen.dart';

enum TabItem { main, map, info, home }

const Map<TabItem, int> tabIdx = {
  TabItem.main: 0,
  TabItem.map: 1,
  TabItem.info: 2,
};

Map<TabItem, Widget> tabScreen = {
  TabItem.main: const PharmacySearchScreen(),
  TabItem.map: const PharmacySearch(),
  TabItem.info: const ColdDrugScreen(),
};