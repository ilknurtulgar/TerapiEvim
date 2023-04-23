import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/extension/context_extension.dart';

import '../../../controller/main_controller.dart';
import '../../../controller/video_call/group_call_controller.dart';
import '../../../core/base/component/video_call/buttons/video_call_buttons.dart';
import '../../../core/base/component/video_call/container/video_call_person.dart';
import '../../../core/base/component/video_call/tab/therapist_tab.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../model/common/video_call/video_call_token_model.dart';
import '../../../product/widget/common/video_call/participant_tile.dart';
import '../../participant/video_call/util/utility.dart';

class GroupCallView extends StatelessWidget {
  final VideoCallTokenModel videoCallToken;
  final bool isMainTherapist = false;

  const GroupCallView({
    Key? key,
    required this.videoCallToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find();
    return BaseView<GroupCallController>(
      getController: GroupCallController(),
      onModelReady: (controller) {
        controller.setContext(context);
        controller.setToken(videoCallToken);
      },
      onPageBuilder: (context, controller) =>
          Scaffold(
            backgroundColor: AppColors.doveGray,
            body: Obx(()=>
               SizedBox(
                height: context.height1,
                width: context.width1,
                child: Stack(
                  children: [
                    if (controller.participantVideoStreams.values.isNotEmpty)
                      if (controller.participantVideoStreams.values.first!
                          .renderer !=
                          null)
                        MainTherapistVideo(controller),

                    participantsRowWithButtonsContainer(
                        videoCallController: controller,
                        mainController: mainController,
                        context: context),
                    // bottomOpacity(),
                    // Positioned(
                    //   bottom: 80,
                    //   left: 0,
                    //   right: 0,
                    //   child: SizedBox(
                    //     width: context.width1,
                    //     child: SingleChildScrollView(
                    //       child: Row(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           ...controller.participantVideoStreams.values
                    //               .map((e) => ParticipantTile2(stream: e!))
                    //               .toList()
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   bottom: 80,
                    //   left: 0,
                    //   right: 0,
                    //   child: participantRow(controller),
                    // ),
                    // Positioned(
                    //   bottom: 4,
                    //   left: 0,
                    //   right: 0,
                    //   child: VideoCallButtonsRow(
                    //     firstButton: Obx(
                    //           () =>
                    //       mainController.isTherapist.value
                    //           ? VideoCallUtility.therapistSpecialButton(() =>
                    //           controller.openTherapistTab(
                    //               DemoInformation.participants,
                    //               isMainTherapist
                    //                   ? TherapistTabController
                    //                   .MainTherapistHasControl.obs
                    //                   : controller.hasSecondTherapistControl))
                    //           : VideoCallUtility.putYourHandsUpButton(
                    //             () =>
                    //             controller.onOffFunction(
                    //                 DemoInformation.participants[0].isHandsUp!),
                    //         DemoInformation.participants[0].isHandsUp!,
                    //       ),
                    //     ),
                    //     onToggleMicButtonPressed: () =>
                    //         controller.triggerMicrophone(),
                    //     onToggleCameraButtonPressed: () =>
                    //         controller.triggerCamera(),
                    //     onLeaveButtonPressed: () => controller.leaveRoom(),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Positioned MainTherapistVideo(GroupCallController controller) {
    return Positioned.fill(
      child: ParticipantTile(
        stream: controller.participantVideoStreams.values.first!,
        hasPadding: false,
      ),
    );
  }

  Widget bottomOpacity() {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 305,
          color: Colors.black.withOpacity(0.75),
        ));
  }
}

Align participantsRowWithButtonsContainer({
  required GroupCallController videoCallController,
  required MainController mainController,
  required BuildContext context,
  bool isMainTherapist = false,
}) {
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
                    () =>
                mainController.isTherapist.value
                    ? VideoCallUtility.therapistSpecialButton(() =>
                    videoCallController.openTherapistTab(
                        DemoInformation.participants,
                        isMainTherapist
                            ? TherapistTabController
                            .MainTherapistHasControl.obs
                            : videoCallController
                            .hasSecondTherapistControl))
                    : VideoCallUtility.putYourHandsUpButton(
                      () =>
                      videoCallController.onOffFunction(
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

Widget participantRow(GroupCallController controller,
    [bool isMainTherapist = false]) {
  return Expanded(
    child: Padding(
      padding: AppPaddings.smallHorizontalPadding,
      child: Obx(
            () =>
            ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: controller.participantVideoStreams.values.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: AppPaddings.smallPersonViewPadding,
                    child: VideoCallPerson(
                      whichPage: VideoCallPages.groupCall,
                      videoStream: controller.participantVideoStreams.values
                          .elementAt(index),
                      videoCallViewModel: VideoCallUtility.personSmallView(
                          DemoInformation.participants[index], true, context),
                      onLongPressed: isMainTherapist
                          ? () =>
                          controller.sendIsolatedCall(
                              "${controller.participantValues.values
                                  .elementAt(index)
                                  .name} ${DemoInformation.participants[index]
                                  .surname}")
                          : null,
                      micOnOffFunction: () =>
                          controller.onOffFunction(
                              DemoInformation.participants[index].isMicOn),
                      cameraOnOffFunction: () =>
                          controller.onOffFunction(
                              DemoInformation.participants[index].isCamOn),
                    ),
                  );
                })),
      ),
    ),
  );
}
