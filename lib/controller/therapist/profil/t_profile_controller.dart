import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../profile_settings_controller.dart';

class TProfileController extends IProfileController {
  @override
  void setContext(BuildContext context) {}

  var isMakingShortCallAccepted = false.obs;
  var isBeingAdvisorAccepted = false.obs;
  var isNumberVisible = false
      .obs; // yardımcı psikologluk yapılabilecek grup sayısının belli olması

  void acceptionFunction(bool isAcceptionForMakingShortCall) {
    if (isAcceptionForMakingShortCall) {
      isMakingShortCallAccepted.value = !isMakingShortCallAccepted.value;
      ///TODO save to cache
    } else {
      isBeingAdvisorAccepted.value = !isBeingAdvisorAccepted.value;
      isNumberVisible.value = !isNumberVisible.value;
      ///TODO save to cache

    }
  }
}
