import 'package:flutter/material.dart';

import 'package:news_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'tabs';

  static final Map<String, Widget Function(BuildContext)> routes = {
    'tabs': (BuildContext context) => const TabsScreen(),
    'headlines': (BuildContext context) => const HeadlinesScreen(),
    'tab2': (BuildContext context) => const Tab2Screen(),
  };
}
