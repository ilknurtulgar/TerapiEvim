import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/common/profile/is_being_advisor_accepted_model.dart';
import 'package:terapievim/model/common/profile/max_number_of_groups_model.dart';

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

    isBeingAdvisorAccepted.value =
        localManager.getBoolValue(LocalManagerKeys.isBeingAdvisorAccepted) ??
            false;
    updatedisBeingAdvisorAccepted.value = isBeingAdvisorAccepted.value;

    numberOfGroupsTherapistIsAdvisor.value =
        localManager.getIntValue(LocalManagerKeys.maxNumberOfGroups) ?? 0;
    updatedNumberOfGroups.value = numberOfGroupsTherapistIsAdvisor.value;

    isNumberVisible.value = isBeingAdvisorAccepted.value;

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

    if (isBeingAdvisorAccepted != updatedisBeingAdvisorAccepted.value) {
      final result = await service.setIsBeingAdvisorAccepted(
          IsBeingAdvisorAcceptedModel(
              isBeingAdvisorAccepted: updatedisBeingAdvisorAccepted.value));
      if (result == null) {
        await localManager.setBoolValue(
            LocalManagerKeys.isBeingAdvisorAccepted,updatedisBeingAdvisorAccepted.value);
      }
    }

    if (numberOfGroupsTherapistIsAdvisor != updatedNumberOfGroups.value) {
      final result = await service.updateMaxNumberOfHelpingGroups(
          MaxNumberOfGroupsModel(
              maxNumberOfHelpingGroups: updatedNumberOfGroups.value));
      if (result == null) {
        await localManager.setIntValue(
            LocalManagerKeys.maxNumberOfGroups,updatedNumberOfGroups.value);
      }
    }

    super.save();
  }

  TextEditingController aboutMeController = TextEditingController();

  var isMakingShortCallAccepted = false.obs;

  var isBeingAdvisorAccepted = false.obs;
  RxInt numberOfGroupsTherapistIsAdvisor = 0.obs;
  var isNumberVisible = false
      .obs; // yardımcı psikologluk yapılabilecek grup sayısının belli olması
  var updatedNumberOfGroups = 0.obs;
  var updatedisBeingAdvisorAccepted = false.obs;

  String aboutMe = '';

  void acceptionFunction() {
    updatedisBeingAdvisorAccepted.value = !updatedisBeingAdvisorAccepted.value;
    isNumberVisible.value = !isNumberVisible.value;

    ///TODO save to cache
  }

  void chooseGroupNumber(int value) {
    if (updatedisBeingAdvisorAccepted.value)
      updatedNumberOfGroups.value = value;
  }
}
