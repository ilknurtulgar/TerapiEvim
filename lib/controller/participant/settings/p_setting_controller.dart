import 'package:get/get.dart';

class PSettingsController extends GetxController {
  RxBool notificationButton = false.obs;
  bool getNotificationValue() {
    return notificationButton.value;
  }

  void changeNotificationButton(bool value) {
    notificationButton.value = value;
    notifyChildrens();
  }
}
