import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import 'package:terapievim/core/base/component/video_call/tab/therapist_tab.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/core/extension/context_extension.dart';

import '../../../controller/main_controller.dart';
import '../../../controller/video_call/group_therapy_call_controller.dart';
import '../../../core/base/component/video_call/container/video_call_person.dart';
import '../../participant/video_call/util/utility.dart';

// ignore: must_be_immutable
class GroupTherapyCallView extends StatelessWidget {
  GroupTherapyCallView({super.key});
  MainController mainController = Get.find();
  bool isMainTherapist = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<PGroupCallController>(
        getController: PGroupCallController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
            body: SafeArea(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Get.closeCurrentSnackbar(),
                child: Stack(
                  children: [
                    therapistView(controller, context),
                    participantsRowWithButtonsContainer(controller, context)
                  ],
                ),
              ),
            ),
          );
        });
  }

  VideoCallPerson therapistView(
      PGroupCallController videoCallController, BuildContext context) {
    return VideoCallPerson(
      videoCallViewModel: VideoCallUtility.personBigView(
          DemoInformation.therapist, true, context),
      whichPage: VideoCallPages.groupCall,
      micOnOffFunction: () =>
          videoCallController.onOffFunction(DemoInformation.therapist.isMicOn),
      cameraOnOffFunction: () =>
          videoCallController.onOffFunction(DemoInformation.therapist.isCamOn),
    ); // kamera ve mikrofon fonksiyonları şu an görsellerle çalıştığım için gerekli, servis bağlandıktan sonra kalkacak
  }

  Align participantsRowWithButtonsContainer(
      PGroupCallController videoCallController, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: AppColors.lightBlack,
          height: Responsive.height(SizeUtil.hugeValueHeight, context),
          width: context.width1,
          child: Column(
            children: [
              participantRow(videoCallController),
              VideoCallButtonsRow(
                firstButton: Obx(
                  () => mainController.isTherapist.value
                      ? VideoCallUtility.therapistSpecialButton(() =>
                          videoCallController
                              .openTherapistTab(DemoInformation.participants,isMainTherapist ? TherapistTabControle.MainTherapistHasControl.obs : videoCallController.hasSecondTherapistControl))
                      : VideoCallUtility.putYourHandsUpButton(
                          () => videoCallController.onOffFunction(
                              DemoInformation.participants[0].isHandsUp!),
                          DemoInformation.participants[0].isHandsUp!,
                        ),
                ),
                onLeaveButtonPressed: () {},
                onToggleCameraButtonPressed: () {},
                onToggleMicButtonPressed: () {},
              ),
            ],
          )),
    );
  }

  Widget participantRow(PGroupCallController videoCallController) {
    return Expanded(
      child: Padding(
        padding: AppPaddings.smallHorizontalPadding,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: DemoInformation.participants.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: AppPaddings.smallPersonViewPadding,
                child: VideoCallPerson(
                  whichPage: VideoCallPages.groupCall,
                  videoCallViewModel: VideoCallUtility.personSmallView(
                      DemoInformation.participants[index], true, context),
                  onLongPressed: isMainTherapist
                      ? () => videoCallController.sendIsolatedCall(
                          "${DemoInformation.participants[index].name} ${DemoInformation.participants[index].surname}")
                      : null,
                  micOnOffFunction: () => videoCallController.onOffFunction(
                      DemoInformation.participants[index].isMicOn),
                  cameraOnOffFunction: () => videoCallController.onOffFunction(
                      DemoInformation.participants[index].isCamOn),
                ),
              );
            })),
      ),
    );
  }
}
