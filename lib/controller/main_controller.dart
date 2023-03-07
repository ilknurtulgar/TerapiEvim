import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../core/base/component/bottom_nav_bar/custom_tab_scaffold.dart';
import '../core/base/component/toast/toast.dart';

class MainController extends GetxController {
  var currentScreenIndex = 0.obs;
  var isTestNotSolved = false.obs;
  var isTestResultReady = true.obs;
  var isGroupReady = true.obs;
  var isLogged = false.obs;

  late CupertinoTabController tabController;

  DateTime _oldTime = DateTime.now();
  DateTime _newTime = DateTime.now();

  @override
  void onInit() {
    tabController = CupertinoTabController();

    super.onInit();
  }

  void onPageChanged(int index) {
    tabController.index = index;
    currentScreenIndex.value = index;
  }

  ///This functon makes a user to tap back twice to pop
  Future<bool> onWillPop() {

    _newTime = DateTime.now();
    if (_newTime.difference(_oldTime) > const Duration(seconds: 2)) {
      _oldTime = _newTime;
      flutterDarkToast("MessageConst.quitApp");
      return Future.value(false);
    }
    SystemNavigator.pop();
    return Future.value(true);
  }


  changeScreen(int index) {
    switch (index) {
      case 0:
        currentScreenIndex.value = 0;
        break;
      case 1:
        currentScreenIndex.value = 1;
        break;
      case 2:
        currentScreenIndex.value = 2;
        break;
      case 3:
        currentScreenIndex.value = 3;
        break;
      case 4:
        currentScreenIndex.value = 4;
        break;
    }
  }
}
