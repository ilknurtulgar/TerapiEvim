import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import 'util/utility.dart';
import '../../../core/base/component/video_call/video_call_container/video_call_person_view.dart';

class GroupTherapyCallPage extends StatelessWidget {
  const GroupTherapyCallPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            VideoCallPersonView(videoCallViewModel: VideoCallUtility.personBigView(DemoInformation.therapist, true)),
            participantsRowWithButtonsContainer()
          ],
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
              mediumSizedBox(),
              participantRow(),
              const VideoCallButtonsRow(),
            ],
          )),
    );
  }

  Expanded participantRow() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: DemoInformation.participants.length,
          itemBuilder: ((context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: VideoCallPersonView(
                    videoCallViewModel: VideoCallUtility.personSmallView(DemoInformation.participants[index], true)));
          })),
    );
  }
}
