import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/video_call/components/buttons/video_call_buttons.dart';
import 'package:terapievim/screen/video_call/components/video_call_container/video_call_person_view_component.dart';
import 'package:terapievim/screen/video_call/model/person_in_call_model.dart';

import '../base_utility/video_call_utility.dart';

class ShortCallPage extends StatelessWidget {
  const ShortCallPage(
      {super.key, required this.therapist, required this.participant});
  final PersonInCallModel therapist;
  final PersonInCallModel participant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mineShaft,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: VideoCallPersonView(
                videoCallViewModel:
                    VideoCallUtility.personShortCallView(therapist)),
          ),
          VideoCallPersonView(
              videoCallViewModel:
                  VideoCallUtility.personShortCallView(participant)),
          VideoCallButtonsRow(),
        ],
      ),
    );
  }
}
