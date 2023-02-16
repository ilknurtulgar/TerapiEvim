import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import 'package:terapievim/screen/participant/video_call/model/person_in_call_model.dart';
import 'util/utility.dart';
import '../../../core/base/component/video_call/video_call_container/video_call_person_view.dart';

class ShortCallPage extends StatelessWidget {
  ShortCallPage({
    super.key,
  });
  final PersonInCallModel therapist = PersonInCallModel(
      name: 'Simay',
      surname: 'Selli',
      imagePath: 'assets/images/f1.jpg',
      isMicOn: true,
      isCamOn: true);
  final PersonInCallModel participant = PersonInCallModel(
      name: 'Kerem',
      surname: 'Görkem',
      imagePath: 'assets/images/f2.jpg',
      isMicOn: false,
      isCamOn: true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mineShaft,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            therapistCallView(),
            VideoCallPersonView(
                videoCallViewModel: VideoCallUtility.personShortCallView(
                    participant)), // participantCallView
            const VideoCallButtonsRow(),
          ],
        ),
      ),
    );
  }

  Padding therapistCallView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: VideoCallPersonView(
          videoCallViewModel: VideoCallUtility.personShortCallView(therapist)),
    );
  }
}
