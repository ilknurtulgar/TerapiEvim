import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../model/common/profile/about_me_model.dart';
import '../../profile_settings_controller.dart';

class TProfileSettingsController extends IProfileSettingsController {
  @override
  void setContext(BuildContext context) {}

  @override
  Future<void> save() async {
    ///TODO add aboutMe service
    service.updateAboutMe(AboutMeModel(aboutMe: ''));
    super.save();
  }

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

  RxInt numberOfGroupsTherapistIsAdvisor = 0.obs;

  void chooseGroupNumber(int value) {
    if (isBeingAdvisorAccepted.value)
      numberOfGroupsTherapistIsAdvisor.value = value;
  }
}
