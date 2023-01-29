import 'package:get/get.dart';

class MainController extends GetxController {
  var currentScreenIndex = 0.obs;
  var isTestSolved = false.obs;
  var isTestResultReady = true.obs;
  ChangeScreen(int index) {
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
