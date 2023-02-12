import 'package:get/get.dart';

class VideoCallController extends GetxController{
  var isViewPlaceChanged = false.obs;
  changeViewPlaces() {
    // isolated call'da çift tıklayınca terapist ile danışanın görüntü olarak yerlerinin değişmesi fonksiyonu
    isViewPlaceChanged.value = !isViewPlaceChanged.value;
  }

}