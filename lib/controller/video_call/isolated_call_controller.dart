import 'package:get/get.dart';

class IsolatedCallController extends GetxController{
  void onOffFunction(RxBool variable) {
    variable.value = !variable.value;
  }

  var isViewPlaceChanged = false.obs;
  changeViewPlaces() {
    // isolated call'da çift tıklayınca terapist ile danışanın görüntü olarak yerlerinin değişmesi fonksiyonu
    isViewPlaceChanged.value = !isViewPlaceChanged.value;
  }
}