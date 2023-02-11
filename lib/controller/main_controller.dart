import 'package:get/get.dart';

class MainController extends GetxController {
  var currentScreenIndex = 0.obs;
  var isViewPlaceChanged = false.obs;
  var isTestNotSolved = true.obs;
  var isTestResultReady = false.obs;
  var isGroupReady = false.obs;
  var isLogged = true.obs;

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

  changeViewPlaces() {
    // isolated call'da çift tıklayınca terapist ile danışanın görüntü olarak yerlerinin değişmesi fonksiyonu
    isViewPlaceChanged.value = !isViewPlaceChanged.value;
  }
}
