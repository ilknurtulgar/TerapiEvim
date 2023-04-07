import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/video_call_controller.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import 'package:terapievim/core/base/ui_models/video_call/person_in_call_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../core/base/component/video_call/container/video_call_person.dart';
import 'util/utility.dart';

// ignore: must_be_immutable
class ShortCallView extends StatelessWidget {
   ShortCallView({
    super.key,
  });
  VideoCallController videoCallController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mineShaft,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            personCallView(DemoInformation.therapist,context),
            mediumSizedBox(),
            personCallView(DemoInformation.personNo1, context), // participantCallView
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

  Widget personCallView(PersonInCallModel person,BuildContext context,) {
    return VideoCallPerson(
      micOnOffFunction: () => videoCallController.onOffFunction(person.isMicOn),
      cameraOnOffFunction: () => videoCallController.onOffFunction(person.isCamOn),
      videoCallViewModel: VideoCallUtility.personShortCallView(person, context),
      whichPage: 3,
    );
  }
}
