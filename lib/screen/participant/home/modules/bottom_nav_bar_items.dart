part of '../main_home.dart';

List<BottomNavigationBarItem> _bottomNavBarItems(BuildContext context) {
  MainController controller = Get.find();
  bool isTherapist = controller.isTherapist.value;
  List<BottomNavigationBarItem> bottomBarList = [];
  int i;

  for (i = 0; i < 5; i++) {
    if (!isTherapist && i == 4) {
      bottomBarList.add(BottomNavigationBarItem(
        icon: _BottomNavBarItem(i, context.theme, false),
        activeIcon: _BottomNavBarItem(i, context.theme, true),
      ));
    }
  }

  return bottomBarList;
}
