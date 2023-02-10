import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/video_call/base_utility/video_call_utility.dart';
import 'package:terapievim/screen/video_call/components/buttons/video_call_buttons.dart';
import 'package:terapievim/screen/video_call/components/video_call_container/video_call_person_view_component.dart';
import 'package:terapievim/screen/video_call/model/person_in_call_model.dart';
import '../../../controller/mainController.dart';

class IsolatedCallPage extends StatelessWidget {
  IsolatedCallPage(
      {super.key, required this.therapist, required this.participant});
  PersonInCallModel therapist;
  PersonInCallModel participant;
  MainController controller = Get.put(
      MainController()); // daha önce başka bir sayfa için kullanılmadığı için uygulama şu anlık hata vermesin diye get.put kullandım ileriki süreçte get.find'a çeviririz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        VideoCallPersonView(
            onDoubleTap: () => controller.isViewPlaceChanged,
            videoCallViewModel: VideoCallUtility.personBigView(
                controller.isViewPlaceChanged.value ? participant : therapist,
                false)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              color: AppColors.lightBlack,
              height: 117,
              width: window.physicalSize.width,
              child: const VideoCallButtonsRow()),
        ),
        Positioned(
            right: 20,
            bottom: 137,
            child: VideoCallPersonView(
                onDoubleTap: () => controller.isViewPlaceChanged,
                videoCallViewModel: VideoCallUtility.personSmallView(
                    controller.isViewPlaceChanged.value
                        ? therapist
                        : participant,
                    false)))
      ]),
    );
  }
}
