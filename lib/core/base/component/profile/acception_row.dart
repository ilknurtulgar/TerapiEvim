import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../../controller/therapist_profile_controller.dart';
import '../../util/text_utility.dart';

class AcceptionRow extends StatelessWidget {
   AcceptionRow({super.key,required this.isForMakingShortCall});
  final bool isForMakingShortCall;
  final TherapistProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: isForMakingShortCall
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          textDirection:
              isForMakingShortCall ? TextDirection.ltr : TextDirection.rtl,
          children: [
            Obx(() => IconButton(
                onPressed: () => controller.acceptionFunction(isForMakingShortCall),
                icon: Icon(isForMakingShortCall
                    ? controller.isMakingShortCallAccepted.value
                        ? IconUtility.checkCircleIcon.icon
                        : IconUtility.circleIcon.icon
                    : controller.isBeingAdvisorAccepted.value
                        ? IconUtility.checkCircleIcon.icon
                        : IconUtility.circleIcon.icon))),
            Text(isForMakingShortCall
                ? LoginSignUpTextUtil.therapistAcceptedMakingShortCall
                : ProfileSettingsTextUtil.therapistAcceptedRandomTherapistList)
          ]);
  }
}