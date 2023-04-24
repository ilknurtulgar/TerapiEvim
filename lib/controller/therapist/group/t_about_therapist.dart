import 'package:get/get.dart';

class TAboutTherapistController extends GetxController {
  RxBool isTherapistUploaded = true.obs;
  void changeIsTherapistLoaded() {
    isTherapistUploaded.value = !isTherapistUploaded.value;
  }
  //yapilmadi
  //terapistin bilgielero alinmali
}
