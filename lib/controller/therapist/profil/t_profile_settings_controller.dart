import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/common/profile/about_me_model.dart';
import '../../../product/enum/local_keys_enum.dart';
import '../../profile_settings_controller.dart';

class TProfileSettingsController extends IProfileSettingsController {
  @override
  void setContext(BuildContext context) {}

  @override
  void onInit() {
    aboutMe = localManager.getStringValue(LocalManagerKeys.aboutMe);
    aboutMeController.text = aboutMe;
    super.onInit();
  }

  @override
  Future<void> save() async {
    if (aboutMe != aboutMeController.text.trim()) {
      final result = await service
          .updateAboutMe(AboutMeModel(aboutMe: aboutMeController.text.trim()));
      if (result == null) {
        await localManager.setStringValue(
            LocalManagerKeys.aboutMe, aboutMeController.text.trim());
      }
    }
    super.save();
  }

  TextEditingController aboutMeController = TextEditingController();

  var isMakingShortCallAccepted = false.obs;
  var isBeingAdvisorAccepted = false.obs;
  var isNumberVisible = false
      .obs; // yardımcı psikologluk yapılabilecek grup sayısının belli olması

  void acceptionFunction() {
    isBeingAdvisorAccepted.value = !isBeingAdvisorAccepted.value;
    isNumberVisible.value = !isNumberVisible.value;

    ///TODO save to cache
  }

  RxInt numberOfGroupsTherapistIsAdvisor = 0.obs;
  String aboutMe = '';

  void chooseGroupNumber(int value) {
    if (isBeingAdvisorAccepted.value)
      numberOfGroupsTherapistIsAdvisor.value = value;
  }
}
