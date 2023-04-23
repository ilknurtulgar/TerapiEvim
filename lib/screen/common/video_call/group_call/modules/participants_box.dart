import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/main_controller.dart';
import '../../../../../controller/video_call/group_call_controller.dart';
import '../../../../../core/base/component/video_call/buttons/video_call_buttons.dart';
import '../../../../../core/base/component/video_call/tab/therapist_tab.dart';
import '../../../../../core/base/util/base_utility.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../participant/video_call/util/utility.dart';
import 'participants_list.dart';

class ParticipantsBoxGroupCall extends StatelessWidget {
  const ParticipantsBoxGroupCall(
      {Key? key,
      required this.videoCallController,
      required this.mainController,
      required this.context,
      this.isMainTherapist = false})
      : super(key: key);
  final GroupCallController videoCallController;
  final MainController mainController;
  final BuildContext context;

  final bool isMainTherapist;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: AppColors.lightBlack,
          height: Responsive.height(SizeUtil.hugeValueHeight, context),
          width: context.width1,
          child: Column(
            children: [
              ParticipantsRow(
                  controller: videoCallController,
                  isMainTherapist:
                      videoCallController.currentToken.isMainTherapist),
              VideoCallButtonsRow(
                firstButton: Obx(
                  () => mainController.isTherapist.value
                      ? VideoCallUtility.therapistSpecialButton(() =>
                          videoCallController.openTherapistTab(
                              DemoInformation.participants,
                              isMainTherapist
                                  ? TherapistTabController
                                      .MainTherapistHasControl.obs
                                  : videoCallController
                                      .hasSecondTherapistControl))
                      : VideoCallUtility.putYourHandsUpButton(
                          () => videoCallController.onOffFunction(
                              DemoInformation.participants[0].isHandsUp!),
                          DemoInformation.participants[0].isHandsUp!,
                        ),
                ),
                onToggleMicButtonPressed: () =>
                    videoCallController.triggerMicrophone(),
                onToggleCameraButtonPressed: () =>
                    videoCallController.triggerCamera(),
                onLeaveButtonPressed: () => videoCallController.leaveRoom(),
              ),
            ],
          )),
    );
  }
}
