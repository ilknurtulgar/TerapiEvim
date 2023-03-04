import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                        ? Icons.check_circle_outline
                        : Icons.circle_outlined
                    : controller.isBeingAdvisorAccepted.value
                        ? Icons.check_circle_outline
                        : Icons.circle_outlined))),
            Text(isForMakingShortCall
                ? LoginSignUpTextUtil.therapistAcceptedMakingShortCall
                : ProfileSettingsTextUtil.therapistAcceptedRandomTherapistList)
          ]);
  }
}