import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_app/screens/screens.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavigationModel(),
      child: const Scaffold(
        body: _NewsPages(),
        bottomNavigationBar: _NavigationBar(),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
        currentIndex: navigationModel.actualScreen,
        onTap: (value) => navigationModel.actualScreen = value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Headlines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'Categories',
          )
        ]);
  }
}

class _NewsPages extends StatelessWidget {
  const _NewsPages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [HeadlinesScreen(), Tab2Screen()],
    );
  }
}

class _NavigationModel extends ChangeNotifier {
  int _actualScreen = 0;
  final PageController _pageController = PageController();

  int get actualScreen => _actualScreen;

  set actualScreen(int screen) {
    _actualScreen = screen;
    _pageController.animateToPage(
      screen,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 200),
    );
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
