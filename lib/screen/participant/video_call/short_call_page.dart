import 'dart:js';

import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import 'util/utility.dart';
import '../../../core/base/component/video_call/video_call_container/video_call_person_view.dart';

class ShortCallPage extends StatelessWidget {
  const ShortCallPage({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mineShaft,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            therapistCallView(context),
            VideoCallPersonView(videoCallViewModel: VideoCallUtility.personShortCallView(DemoInformation.personNo1,context)), // participantCallView
            const VideoCallButtonsRow(),
          ],
        ),
      ),
    );
  }

  Padding therapistCallView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20), //değişecek
      child: VideoCallPersonView(
          videoCallViewModel: VideoCallUtility.personShortCallView(DemoInformation.therapist,context)),
    );
  }
}
