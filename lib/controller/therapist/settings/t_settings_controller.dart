import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';

class TSettingsController extends GetxController with BaseController {
  RxBool notificationButton = false.obs;

  bool getNotificationValue() {
    return notificationButton.value;
  }

  void changeNotificationButton(bool value) {
    notificationButton.value = value;
    notifyChildrens();
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
}
