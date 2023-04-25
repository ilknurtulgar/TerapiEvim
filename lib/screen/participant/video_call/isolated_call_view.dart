import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/video_call/isolated_call_controller.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import 'package:terapievim/core/base/component/video_call/container/video_call_person.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/video_call/util/utility.dart';

// ignore: must_be_immutable
class IsolatedCallView extends StatelessWidget {
  IsolatedCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<IsolatedCallController>(
        getController: IsolatedCallController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
            body: SafeArea(
              child: Stack(children: [
                personBigViewInCall(controller, context),
                buttonsRowContainer(context),
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

  Align buttonsRowContainer(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: AppColors.lightBlack,
          height: Responsive.height(SizeUtil.mediumValueHeight, context),
          width: context.width1,
          child: VideoCallButtonsRow(
            isCameraOn: true.obs,
            isMicOn: true.obs,
            onLeaveButtonPressed: () {},
            onToggleCameraButtonPressed: () {},
            onToggleMicButtonPressed: () {},
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
