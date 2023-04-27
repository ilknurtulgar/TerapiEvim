import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/video_call/group_call_controller.dart';
import '../../../../../core/base/component/video_call/buttons/video_call_buttons.dart';
import '../../../../../core/base/component/video_call/tab/therapist_tab.dart';
import '../../../../../core/base/util/base_utility.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../model/common/video_call/video_call_token_model.dart';
import '../../util/utility.dart';
import 'participants_list.dart';

class ParticipantsBoxGroupCall extends StatelessWidget {
  const ParticipantsBoxGroupCall({Key? key, required this.videoCallController})
      : super(key: key);
  final GroupCallController videoCallController;

  @override
  Widget build(BuildContext context) {
    final VideoCallTokenModel currentToken = videoCallController.currentToken;

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
                  isMainTherapist: currentToken.isMainTherapist),
              VideoCallButtonsRow(
                isCameraOn: videoCallController.camEnabled,
                isMicOn: videoCallController.micEnabled,
                firstButton: currentToken.isTherapist
                    ? VideoCallUtility.therapistSpecialButton(() =>
                        videoCallController.openTherapistTab(
                            DemoInformation.participants,
                            currentToken.isMainTherapist
                                ? TherapistTabController
                                    .MainTherapistHasControl.obs
                                : videoCallController
                                    .hasSecondTherapistControl))
                    : SizedBox.shrink(),
                onToggleMicButtonPressed: () =>
                    videoCallController.triggerMicrophone(),
                onToggleCameraButtonPressed: () =>
                    videoCallController.triggerCamera(),
                onLeaveButtonPressed: () =>
                    videoCallController.endCallToMainView(),
              ),
            ],
          )),
    );
  }
}
