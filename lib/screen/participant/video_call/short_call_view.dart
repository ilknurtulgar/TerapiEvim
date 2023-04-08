import 'package:flutter/material.dart';
import 'package:terapievim/controller/video_call_controller.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import 'package:terapievim/core/base/ui_models/video_call/person_in_call_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import '../../../core/base/component/video_call/container/video_call_person.dart';
import 'util/utility.dart';

// ignore: must_be_immutable
class ShortCallView extends StatelessWidget {
   ShortCallView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<VideoCallController>(
      getController: VideoCallController(),
      onModelReady: (model) {},
      onPageBuilder: (context,controller) {
        return Scaffold(
          backgroundColor: AppColors.mineShaft,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                personCallView(controller,DemoInformation.therapist,context), // therapistCallView
                mediumSizedBox(),
                personCallView(controller,DemoInformation.personNo1,context), // participantCallView
                mediumSizedBox(),
                VideoCallButtonsRow(
                  onLeaveButtonPressed: () {},
                  onToggleCameraButtonPressed: () {},
                  onToggleMicButtonPressed: () {},
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget personCallView(VideoCallController videoCallController,PersonInCallModel person,BuildContext context) {
    return VideoCallPerson(
      micOnOffFunction: () => videoCallController.onOffFunction(person.isMicOn),
      cameraOnOffFunction: () => videoCallController.onOffFunction(person.isCamOn),
      videoCallViewModel: VideoCallUtility.personShortCallView(person, context),
      whichPage: VideoCallPages.shortCall,
    );
  }
}
