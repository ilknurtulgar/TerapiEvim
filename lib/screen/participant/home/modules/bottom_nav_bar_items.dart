part of '../main_home.dart';

List<BottomNavigationBarItem> _bottomNavBarItems(BuildContext context) {
  return [
    BottomNavigationBarItem(
      icon: _BottomNavBarItem(0, context.theme, false),
      activeIcon: _BottomNavBarItem(0, context.theme, true),
    ),
    BottomNavigationBarItem(
      icon: _BottomNavBarItem(1, context.theme, false),
      activeIcon: _BottomNavBarItem(1, context.theme, true),
    ),
    BottomNavigationBarItem(
      icon: _BottomNavBarItem(2, context.theme, false),
      activeIcon: _BottomNavBarItem(2, context.theme, true),
    ),
    BottomNavigationBarItem(
      icon: _BottomNavBarItem(3, context.theme, false),
      activeIcon: _BottomNavBarItem(3, context.theme, true),
    ),
    BottomNavigationBarItem(
      icon: _BottomNavBarItem(4, context.theme, false),
      activeIcon: _BottomNavBarItem(4, context.theme, true),
    ),
  ];
}
