// ignore: implementation_imports
import 'package:get/get.dart';

class ActivityController extends GetxController {
  RxList<bool> activityIcon = [true, true, true, true, true, true, true].obs;

  void iconFilter(int index) {
    activityIcon[index] = !activityIcon[index];
  }


  var selectedBox = false.obs;

  void changeBox() {
    selectedBox.value = !selectedBox.value;
  }

  late RxInt selectedValue;

  void selectedInt(val) {
    selectedValue.value = val;
  }

  var isObsecure = true.obs;

  var yasemin = false.obs;

  void obsecureChange() {
    isObsecure.value = !isObsecure.value;
  }
}
