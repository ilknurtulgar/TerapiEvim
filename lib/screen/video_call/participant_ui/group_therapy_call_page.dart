import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/video_call/base_utility/video_call_utility.dart';
import 'package:terapievim/screen/video_call/components/buttons/video_call_buttons.dart';
import 'package:terapievim/screen/video_call/components/video_call_container/video_call_person_view_component.dart';
import 'package:terapievim/screen/video_call/model/person_in_call_model.dart';

class GroupTherapyCallPage extends StatelessWidget {
  const GroupTherapyCallPage(
      {super.key, required this.therapist, required this.participants});
  final List<PersonInCallModel> participants;
  final PersonInCallModel therapist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          VideoCallPersonView(
              videoCallViewModel:
                  VideoCallUtility.personBigView(therapist, true)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: AppColors.mineShaft,
                height: 281,
                width: window.physicalSize.width,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    participantRow(),
                    VideoCallButtonsRow(),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Expanded participantRow() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: participants.length,
          itemBuilder: ((context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: VideoCallPersonView(
                    videoCallViewModel: VideoCallUtility.personSmallView(
                        participants[index], true)));
          })),
    );
  }
}
