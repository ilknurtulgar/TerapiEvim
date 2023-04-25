import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videosdk/videosdk.dart';

import '../../../../controller/video_call/short_call_controller.dart';
import '../../../../core/base/component/video_call/buttons/video_call_buttons.dart';
import '../../../../core/base/component/video_call/container/video_call_person.dart';
import '../../../../core/base/ui_models/video_call/person_in_call_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../model/common/video_call/video_call_token_model.dart';
import '../util/utility.dart';

class ShortCallView extends StatelessWidget {
  ShortCallView({super.key, required this.videoCallToken});

  final VideoCallTokenModel videoCallToken;

  @override
  Widget build(BuildContext context) {
    return BaseView<ShortCallController>(
        getController: ShortCallController(),
        onModelReady: (controller) {
          controller.setContext(context);
          controller.setToken(videoCallToken);
        },
        onPageBuilder: (context, controller) {
          return Scaffold(
            backgroundColor: AppColors.mineShaft,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Obx(
                    () => PersonCallView(
                      onMicTriggered: () {
                        controller
                            .onOffFunction(DemoInformation.therapist.isMicOn);
                      },
                      onCameraTriggered: () {
                        controller
                            .onOffFunction(DemoInformation.therapist.isCamOn);
                      },
                      person: DemoInformation.therapist,
                      videoStream:
                          controller.participantVideoStreams.values.isNotEmpty
                              ? controller.participantVideoStreams.values.first
                              : null,
                    ),
                  ),
                  // personCallView(
                  //     controller, DemoInformation.therapist, context),
                  // therapistCallView
                  mediumSizedBox(),
                  Obx(
                    () => PersonCallView(
                      onMicTriggered: () {
                        controller
                            .onOffFunction(DemoInformation.therapist.isMicOn);
                      },
                      onCameraTriggered: () {
                        // controller
                        //     .onOffFunction(DemoInformation.therapist.isCamOn);
                        print(
                            'participantVideoStreams.values:${controller.participantVideoStreams.values.elementAt(2)}');
                      },
                      person: DemoInformation.therapist,
                      videoStream:
                          controller.participantVideoStreams.values.length == 2
                              ? controller.participantVideoStreams.values
                                  .elementAt(1)
                              : null,
                    ),
                  ),
                  // personCallView(controller, DemoInformation.personNo1,
                  //     context), // participantCallView
                  mediumSizedBox(),
                  VideoCallButtonsRow(
                    isMicOn: controller.micEnabled,
                    isCameraOn: controller.camEnabled,
                    onToggleMicButtonPressed: () =>
                        controller.triggerMicrophone(),
                    onToggleCameraButtonPressed: () =>
                        controller.triggerCamera(),
                    onLeaveButtonPressed: () => controller.leaveRoom(),
                  ),
                ],
              ),
            ),
          );
        });
  }

// Widget personCallView(ShortCallController videoCallController,
//     PersonInCallModel person, BuildContext context) {
//   return Obx(
//     () => VideoCallPerson(
//         micOnOffFunction: () =>
//             videoCallController.onOffFunction(person.isMicOn),
//         cameraOnOffFunction: () =>
//             videoCallController.onOffFunction(person.isCamOn),
//         videoCallViewModel:
//             VideoCallUtility.personShortCallView(person, context),
//         whichPage: VideoCallPages.shortCall,
//         videoStream:
//             videoCallController.participantVideoStreams.values.isNotEmpty
//                 ? videoCallController
//                     .participantVideoStreams.values.first?.renderer
//                 : null),
//   );
// }
}

class PersonCallView extends StatelessWidget {
  const PersonCallView({
    Key? key,
    required this.onMicTriggered,
    required this.onCameraTriggered,
    required this.person,
    this.videoStream,
  }) : super(key: key);
  final void Function() onMicTriggered, onCameraTriggered;
  final PersonInCallModel person;
  final Stream? videoStream;

  @override
  Widget build(BuildContext context) {
    return VideoCallPerson(
        micOnOffFunction: onMicTriggered,
        cameraOnOffFunction: onCameraTriggered,
        videoCallViewModel:
            VideoCallUtility.personShortCallView(person, context),
        whichPage: VideoCallPages.shortCall,
        videoStream: videoStream);
  }
}
