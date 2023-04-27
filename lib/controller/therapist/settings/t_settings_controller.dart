import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/base_controller_2.dart';

class TSettingsController extends BaseController2 {
  @override
  void setContext(BuildContext context) {
    controllerContext = context;
  }

  RxBool notificationButton = false.obs;

  bool getNotificationValue() {
    return notificationButton.value;
  }

  void changeNotificationButton(bool value) {
    notificationButton.value = value;
    notifyChildrens();
  }

  Future<void> onSignOut(BuildContext context) async {
    final NavigatorState navigator = Navigator.of(context, rootNavigator: true);
    await localManager.clearAll();
    FirebaseAuth.instance.signOut();
    //navigationManager.pushAndRemoveUntil(navigator, SignInView());
  }
}
