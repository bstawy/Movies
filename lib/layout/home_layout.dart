import 'package:flutter/material.dart';
import 'package:movies/pages/browse/browse_view.dart';
import 'package:movies/pages/home/home_view.dart';
import 'package:movies/pages/watchlist/watchlist_view.dart';

import '../pages/search/search_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home-layout';

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedViewIndex = 0;
  List<Widget> views = const [
    HomeView(),
    SearchView(),
    BrowseView(),
    WatchListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedViewIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectedViewIndex = index;
          setState(() {});
        },
        currentIndex: selectedViewIndex,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/home_icon.png'),
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/search_icon.png'),
            ),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/browse_icon.png'),
            ),
            label: 'BROWSE',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/watchlist_icon.png'),
            ),
            label: 'WATCHLIST',
          ),
        ],
      ),
    );
  }
}