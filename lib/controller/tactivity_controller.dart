import 'package:get/get.dart';

class TherapistActivtyController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("thrapist activity init");
  }

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
