import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/video_call/components/buttons/video_call_buttons.dart';
import 'package:terapievim/screen/video_call/model/person_in_call_model.dart';
import '../base_utility/utility.dart';
import '../components/video_call_container/video_call_person_view.dart';

class GroupTherapyCallPage extends StatelessWidget {
  GroupTherapyCallPage({super.key});
  final PersonInCallModel therapist = PersonInCallModel(name: 'Simay', surname: 'Selli', imagePath: 'assets/images/f1.jpg', isMicOn: true, isCamOn: true);
  final PersonInCallModel p1 = PersonInCallModel(name: 'Kerem', surname: 'Görkem', imagePath: 'assets/images/f2.jpg', isMicOn: false, isCamOn: true);
  final PersonInCallModel p2 = PersonInCallModel(name: 'Ali', surname: 'Aydın', imagePath: 'assets/images/f3.jpg', isMicOn: false, isCamOn: true);
  late final List<PersonInCallModel> participants=[p1,p2,p1,p2,p1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          VideoCallPersonView(videoCallViewModel: VideoCallUtility.personBigView(therapist, true)),
          participantsRowWithButtonsContainer()
        ],
      ),
    );
  }

  Align participantsRowWithButtonsContainer() {
    return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              color: AppColors.mineShaft,
              height: 281,
              width: window.physicalSize.width,
              child: Column(
                children: [
                  const SizedBox(height: 20),
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
