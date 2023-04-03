import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';

import '../core/base/component/bottom_nav_bar/custom_tab_scaffold.dart';
import '../core/base/component/toast/toast.dart';

class MainController extends GetxController with BaseController {
  var currentScreenIndex = 0.obs;
  var isTestNotSolved = true.obs;
  var isTestResultReady = false.obs;
  var isGroupReady = true.obs;
  var isTherapist = true.obs; //bunun degisimi yapilacak
  void testSolved() {
    isTestNotSolved.value = false;
  }

  late final CupertinoTabController tabController;

  DateTime _oldTime = DateTime.now();
  DateTime _newTime = DateTime.now();

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  void onInit() {
    tabController = CupertinoTabController();

    /*  final String currentRole =
        localManager.getStringValue(LocalManagerKeys.role);
    updateWhoItIs(currentRole);*/

    super.onInit();
  }

  void onPageChanged(int index) {
    tabController.index = index;
    currentScreenIndex.value = index;
  }

  ///This function makes a user to tap back twice to pop
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

  void updateWhoItIs(String userRole) {
    isTherapist.value = (userRole == "therapist") ? true : false;
  }
}
