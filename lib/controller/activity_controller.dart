import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:terapievim/screen/activity/component/drop_down.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class ActivityController extends GetxController {
  var activityIcon = false.obs;

  void iconFilter() {
    if (activityIcon == false) {
      activityIcon.value = true;
      IconUtility.activityIcon;
    } else {
      activityIcon.value = false;
    }
  }

  var selectedBox = false.obs;
  void changeBox() {
    print("ilknur");
    selectedBox.value = !selectedBox.value;
    print(selectedBox.value.toString());
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
