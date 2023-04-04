import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../../controller/therapist/profil/t_profile_controller.dart';
import '../../util/text_utility.dart';

class AcceptionRow extends StatelessWidget {
  AcceptionRow({super.key, required this.isForMakingShortCall});
  final bool isForMakingShortCall;

  ///TODO: getx controller olmaması gerkeiyor(öncelikle bu şekilde yapmaya çalışmalısın)
  ///özellikle kullanman gerekiyorsa private olarak ayrı bir part/partof  olması gerekir ki başka bi widget görmesin
  final TProfileController controller = Get.find();
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
              onPressed: () =>
                  controller.acceptionFunction(isForMakingShortCall),
              icon: Icon(isForMakingShortCall
                  ? controller.isMakingShortCallAccepted.value
                      ? IconUtility.checkCircleIcon.icon
                      : IconUtility.circleIcon.icon
                  : controller.isBeingAdvisorAccepted.value
                      ? IconUtility.checkCircleIcon.icon
                      : IconUtility.circleIcon.icon))),
          Expanded(
            child: responsivenestext(
                isForMakingShortCall
                    ? LoginSignUpTextUtil.therapistAcceptedMakingShortCall
                    : ProfileSettingsTextUtil
                        .therapistAcceptedRandomTherapistList,
                const TextStyle()),
          )
        ]);
  }
}
