import 'package:get/get.dart';

class TUploadedController extends GetxController {
  RxBool isTherapistUploaded = true.obs;
  void changeIsTherapistLoaded() {
    isTherapistUploaded.value = !isTherapistUploaded.value;
  }
}
