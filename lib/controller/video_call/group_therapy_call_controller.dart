import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

import '../../core/base/component/video_call/tab/therapist_tab.dart';
import '../../core/base/util/base_utility.dart';
import '../../core/base/ui_models/video_call/person_in_call_model.dart';

class PGroupCallController extends GetxController {
  void onOffFunction(RxBool variable) {
    variable.value = !variable.value;
  }

  var shareAuthority = false.obs;
  var openAllMics = false.obs;
  var hasSecondTherapistControl =
      TherapistTabControle.SecondTherapistHasNotControl.obs;

  void therapistSwitchButtonFunction(bool isToOpenMics, bool value,{List<PersonInCallModel>? participants}) {
    if (isToOpenMics) {
        openAllMics.value = value;
        if(value) participants!.forEach((element) {element.isMicOn.value=true;});
        else participants!.forEach((element) {element.isMicOn.value=false;});
    } else {
      shareAuthority.value = value;
        if (value) hasSecondTherapistControl.value = TherapistTabControle.SecondTherapistHasControl;
        else hasSecondTherapistControl.value = TherapistTabControle.SecondTherapistHasNotControl;
    }
  }

  void openTherapistTab(List<PersonInCallModel> participants,
      Rx<TherapistTabControle> whoHasControl) {
    Get.snackbar('', '',
        padding: EdgeInsets.zero,
        borderRadius: 0,
        margin: EdgeInsets.zero,
        backgroundColor: AppColors.mineShaft,
        titleText: TherapistTab(
          participants: participants,
          whoHasControl: whoHasControl,
        ),
        messageText: const SizedBox.shrink(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(minutes: 1));
  }

  void sendIsolatedCall(String name) {
    Get.dialog(AlertDialog(
      content: Text('$name ${VideoCallTextUtil.sendIsolatedCall}'),
      actions: [
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              VideoCallTextUtil.no,
              style: AppTextStyles.groupTextStyle(false),
            )),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              VideoCallTextUtil.yes,
              style: AppTextStyles.groupTextStyle(false),
            )),
      ],
    ));
  }
}
