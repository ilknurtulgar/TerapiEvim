import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/video_call/isolated_call_controller.dart';
import '../../../../core/base/component/video_call/buttons/video_call_buttons.dart';
import '../../../../core/base/component/video_call/container/video_call_person.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../model/common/video_call/video_call_token_model.dart';
import '../util/utility.dart';
import 'modules/therapist_isolated_view.dart';

class IsolatedCallView extends StatelessWidget {
  IsolatedCallView({super.key, required this.videoCallToken});

  final VideoCallTokenModel videoCallToken;

  @override
  Widget build(BuildContext context) {
    return BaseView<IsolatedCallController>(
        getController: IsolatedCallController(),
        onModelReady: (controller) {
          controller.setContext(context);
          controller.setToken(videoCallToken);
        },
        onPageBuilder: (context, controller) {
          return Scaffold(
            body: SafeArea(
              child: Stack(children: [
                TherapistIsolatedView(controller: controller),
                buttonsRowContainer(controller, context),
                personSmallViewInCall(controller, context)
              ]),
            ),
          );
        });
  }

  Positioned personSmallViewInCall(
      IsolatedCallController videoCallController, BuildContext context) {
    return Positioned(
        right: Responsive.height(20, context),
        // eşit oranda değişsinler diye responsive height kullandım burada da(responsive width ile güzel durmadı)
        bottom: Responsive.height(120, context),
        child: Obx(
          () => VideoCallPerson(
            videoStream:
                videoCallController.participantVideoStreams.values.length == 2
                    ? videoCallController.participantVideoStreams.values.last
                    : null,
            onDoubleTap: () => videoCallController.changeViewPlaces(),
            micOnOffFunction: () => videoCallController.onOffFunction(
                videoCallController.isViewPlaceChanged.value
                    ? DemoInformation.therapist.isMicOn
                    : DemoInformation.personNo1.isMicOn),
            cameraOnOffFunction: () => videoCallController.onOffFunction(
                videoCallController.isViewPlaceChanged.value
                    ? DemoInformation.therapist.isCamOn
                    : DemoInformation.personNo1.isCamOn),
            videoCallViewModel: VideoCallUtility.personSmallView(
                videoCallController.isViewPlaceChanged.value
                    ? DemoInformation.therapist
                    : DemoInformation.personNo1,
                false,
                context),
            whichPage: VideoCallPages.isolatedCall,
          ),
        ));
  }

  Align buttonsRowContainer(
      IsolatedCallController controller, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: AppColors.lightBlack,
          height: Responsive.height(SizeUtil.mediumValueHeight, context),
          width: context.width1,
          child: VideoCallButtonsRow(
            isCameraOn: controller.camEnabled,
            isMicOn: controller.micEnabled,
            onToggleMicButtonPressed: () => controller.triggerMicrophone(),
            onToggleCameraButtonPressed: () => controller.triggerCamera(),
            onLeaveButtonPressed: () => controller.leaveRoom(),
          )),
    );
  }

  Obx personBigViewInCall(
      IsolatedCallController videoCallController, BuildContext context) {
    return Obx(
      () => VideoCallPerson(
        micOnOffFunction: () => videoCallController.onOffFunction(
            videoCallController.isViewPlaceChanged.value
                ? DemoInformation.personNo1.isMicOn
                : DemoInformation.therapist.isMicOn),
        cameraOnOffFunction: () => videoCallController.onOffFunction(
            videoCallController.isViewPlaceChanged.value
                ? DemoInformation.personNo1.isCamOn
                : DemoInformation.therapist.isCamOn),
        onDoubleTap: () => videoCallController.changeViewPlaces(),
        videoCallViewModel: VideoCallUtility.personBigView(
            videoCallController.isViewPlaceChanged.value
                ? DemoInformation.personNo1
                : DemoInformation.therapist,
            false,
            context),
        whichPage: VideoCallPages.isolatedCall,
      ),
    );
  }
}
