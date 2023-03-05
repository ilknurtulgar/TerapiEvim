import 'package:get/get.dart';

class TherapistActivtyController extends GetxController {
  var isUpdate = false.obs;
  void updatechnage(int index) {
    if (index == 0) {
      isUpdate.value = true;
    }
    if (index == 1) {
      isUpdate.value = false;
    }
    //s isUpdate.value = !isUpdate.value;
  }
}
