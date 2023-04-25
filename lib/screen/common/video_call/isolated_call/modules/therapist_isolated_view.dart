import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/video_call/group_call_controller.dart';
import '../../../../../controller/video_call/isolated_call_controller.dart';
import '../../../../../core/base/component/video_call/container/video_call_person.dart';
import '../../../../../core/base/util/base_utility.dart';
import '../../util/utility.dart';

class TherapistIsolatedView extends StatelessWidget {
  const TherapistIsolatedView({Key? key, required this.controller}) : super(key: key);

  final IsolatedCallController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final videoStream = controller.participantVideoStreams;
      final name = controller.participantNames;
      return VideoCallPerson(
        videoCallViewModel: VideoCallUtility.personBigView(
            DemoInformation.therapist, true, context),
        whichPage: VideoCallPages.groupCall,
        name: name.isNotEmpty ? name.values.elementAt(0) : '',
        micOnOffFunction: () {
          controller.onOffFunction(DemoInformation.therapist.isMicOn);
        },
        cameraOnOffFunction: () {
          controller.onOffFunction(DemoInformation.therapist.isCamOn);
        },
        videoStream:
            videoStream.values.isNotEmpty ? videoStream.values.first : null,
      );
    }); // kamera ve mikrofon fonksiyonları şu an görsellerle çalıştığım için gerekli, servis bağlandıktan sonra kalkacak
  }
}
