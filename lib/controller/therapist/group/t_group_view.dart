import 'package:get/get.dart';

class TGroupViewController extends GetxController {
  RxBool isLockedOpen = true.obs;
  void changeisLockedOpen() {
    isLockedOpen.value = !isLockedOpen.value;
  }
}
