import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/video_call_controller.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../controller/main_controller.dart';
import '../../../core/base/component/video_call/container/video_call_person.dart';
import 'util/utility.dart';

// ignore: must_be_immutable
class GroupTherapyCallView extends StatelessWidget {
  GroupTherapyCallView({super.key});
  MainController mainController = Get.find();
  VideoCallController videoCallController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Get.closeCurrentSnackbar(),
          child: Stack(
            children: [
              VideoCallPerson(
                videoCallViewModel: VideoCallUtility.personBigView(
                    DemoInformation.therapist, true),
                whichPage: 1,
                 micOnOffFunction: () => videoCallController.onOffFunction(DemoInformation.therapist.isMicOn),
                 cameraOnOffFunction: () => videoCallController.onOffFunction(DemoInformation.therapist.isCamOn),
              ),
              participantsRowWithButtonsContainer()
            ],
          ),
        ),
      ),
    );
  }

  Align participantsRowWithButtonsContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: AppColors.lightBlack,
          height: SizeUtil.hugeValueHeight,
          width: PixelScreen().logicalWidth,
          child: Column(
            children: [
              participantRow(),
              VideoCallButtonsRow(
                firstButton: Obx(
                  () => mainController.isTherapist.value
                      ? VideoCallUtility.therapistSpecialButton(() =>
                          videoCallController
                              .openTherapistTab(DemoInformation.participants))
                      : VideoCallUtility.putYourHandsUpButton(
                          () => videoCallController.onOffFunction(DemoInformation.participants[0].isHandsUp!),
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

  Widget participantRow() {
    return Expanded(
      child: Padding(
        padding: AppPaddings.smallHorizontalPadding,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: DemoInformation.participants.length,
            itemBuilder: ((context, index) {
              return Padding(
                  padding: AppPaddings.smallPersonViewPadding,
                  child: VideoCallPerson(
                      whichPage: 1,
                      videoCallViewModel: VideoCallUtility.personSmallView(DemoInformation.participants[index],true),
                      onLongPressed: mainController.isTherapist.value ? () => videoCallController.sendIsolatedCall("${DemoInformation.participants[index].name} ${DemoInformation.participants[index].surname}") : null,
                      micOnOffFunction: () => videoCallController.onOffFunction(DemoInformation.participants[index].isMicOn),
                      cameraOnOffFunction: () => videoCallController.onOffFunction(DemoInformation.participants[index].isCamOn
                        ),
                       ),
                      );
            })),
      ),
    );
  }
}
