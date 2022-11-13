import 'package:flutter/material.dart';
import 'package:yukmasak/features/yukmasak/presentation/pages/favorite/favorite_page.dart';
import 'package:yukmasak/features/yukmasak/presentation/pages/home/homepage.dart';
import 'package:yukmasak/features/yukmasak/presentation/pages/setting/setting_page.dart';

class Home extends StatefulWidget {
  int tabIndex;
  Home({super.key, this.tabIndex = 0});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final menuNav = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Favorite',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz_outlined),
      label: 'Settings',
    ),
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      widget.tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List listPage = [
      const Homepage(),
      const FavoritePage(),
      const SettingPage()
    ];
    return Scaffold(
      body: listPage[widget.tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: menuNav,
        onTap: _changeSelectedNavBar,
        currentIndex: widget.tabIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
      ),
    );
  }
}
