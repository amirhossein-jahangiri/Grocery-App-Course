import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_course/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'categories.dart';
import 'home_screen.dart';
import 'user.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Home Screen'},
    {'page': CategoriesScreen(), 'title': 'Categories Screen'},
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'User Screen'},
  ];

  int _selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<DarkThemeProvider>();
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedIndex]['title']),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: _isDark
            ? Theme.of(context).cardColor
            : Colors.white,
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue[200] : Colors.black87,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0
                ? IconlyBold.home
                : IconlyLight.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? IconlyBold.category
                : IconlyLight.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2
                ? IconlyBold.buy
                : IconlyLight.buy),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3
                ? IconlyBold.user2
                : IconlyLight.user2),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
