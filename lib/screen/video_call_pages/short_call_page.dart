import 'package:flutter/material.dart';
import '../../components/video_call_components/buttons/video_call_buttons.dart';
import '../../components/video_call_components/video_call_person_view_component.dart';
import '../../core/base/util/base_utility.dart';
import '../../core/base/util/video_call_utility.dart';
import '../../models/person_in_call_model.dart';

class ShortCallPage extends StatelessWidget {
  const ShortCallPage({super.key, required this.therapist, required this.participant});
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
            child: VideoCallPersonView(videoCallViewModel: VideoCallUtility.personShortCallView(therapist)),
          ),
          VideoCallPersonView(videoCallViewModel: VideoCallUtility.personShortCallView(participant)),
          VideoCallButtonsRow(),
        ],
      ),
    );
  }
}
