import 'package:get/get.dart';
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
}
