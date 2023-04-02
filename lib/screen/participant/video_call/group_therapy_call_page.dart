import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../core/base/component/video_call/video_call_container/video_call_person_view.dart';
import 'util/utility.dart';

class GroupTherapyCallPage extends StatelessWidget {
  const GroupTherapyCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Get.closeCurrentSnackbar(),
          child: Stack(
            children: [
              VideoCallPersonView(
                videoCallViewModel: VideoCallUtility.personBigView(
                    DemoInformation.therapist, true),
                whichPage: 1,
                isLongPressActive: false,
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
                isGroupTherapyCall: true,
                onLeaveButtonPressed: () {},
                onToggleCameraButtonPressed: () {},
                onToggleMicButtonPressed: () {},
                isHandsUp: DemoInformation.participants[0].isHandsUp,
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
                  child: VideoCallPersonView(
                    whichPage: 1,
                      videoCallViewModel: VideoCallUtility.personSmallView(
                          DemoInformation.participants[index], true)));
            })),
      ),
    );
  }
}
