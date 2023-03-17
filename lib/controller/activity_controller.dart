// ignore: implementation_imports
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';

class ActivityController extends GetxController with BaseController {
  RxList<bool> activityIcon = [true, true, true, true, true, true, true].obs;

  void iconFilter(int index) {
    activityIcon[index] = !activityIcon[index];
  }

  var gender = "Seçiniz".obs;

  var order = "Yeniden eskiye ".obs;

  void func(
    String value,
    bool isGenderPurpose,
    TextEditingController? textController,
  ) {
    if (textController == null) return;
    if (isGenderPurpose) {
      gender.value = value;
      textController.text = value;
    } else {
      order.value = value;
      textController.text = value;
    }
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
