import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/video_call_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/video_call/base_utility/utility.dart';
import 'package:terapievim/screen/video_call/components/buttons/video_call_buttons.dart';
import 'package:terapievim/screen/video_call/components/video_call_container/video_call_person_view.dart';
import 'package:terapievim/screen/video_call/model/person_in_call_model.dart';

// ignore: must_be_immutable
class IsolatedCallPage extends StatelessWidget {
  IsolatedCallPage({super.key,});
  PersonInCallModel therapist= PersonInCallModel(name: 'Simay', surname: 'Selli', imagePath: 'assets/images/f1.jpg', isMicOn: true, isCamOn: true);
  PersonInCallModel participant= PersonInCallModel(name: 'Kerem', surname: 'Görkem', imagePath: 'assets/images/f2.jpg', isMicOn: false, isCamOn: true);
  VideoCallController videoCallController = Get.put(VideoCallController()); // daha önce başka bir sayfa için kullanılmadığı için uygulama şu anlık hata vermesin diye get.put kullandım ileriki süreçte get.find'a çeviririz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
       children: [
        personBigViewInCall(),
        buttonsRowContainer(),
        personSmallViewInCall()
      ]),
    );
  }

  Positioned personSmallViewInCall() {
    return Positioned(
          right: 20,
          bottom: 137,
          child: VideoCallPersonView(
              onDoubleTap: () => videoCallController.isViewPlaceChanged,
              videoCallViewModel: VideoCallUtility.personSmallView(
                  videoCallController.isViewPlaceChanged.value
                      ? therapist
                      : participant,
                  false)));
  }

  Align buttonsRowContainer() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            color: AppColors.lightBlack,
            height: 117,
            width: window.physicalSize.width,
            child: const VideoCallButtonsRow()),
      );
  }

  VideoCallPersonView personBigViewInCall() {
    return VideoCallPersonView(
          onDoubleTap: () => videoCallController.isViewPlaceChanged,
          videoCallViewModel: VideoCallUtility.personBigView(
              videoCallController.isViewPlaceChanged.value ? participant : therapist,
              false));
  }
}
