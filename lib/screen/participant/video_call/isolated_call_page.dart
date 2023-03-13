import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/video_call_controller.dart';
import 'package:terapievim/core/base/component/video_call/video_call_container/video_call_person_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/video_call/util/utility.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';

// ignore: must_be_immutable
class IsolatedCallPage extends StatelessWidget {
  IsolatedCallPage({super.key});
  
  VideoCallController videoCallController = Get.put(VideoCallController()); // daha önce başka bir sayfa için kullanılmadığı için uygulama şu anlık hata vermesin diye get.put kullandım ileriki süreçte get.find'a çeviririz
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          personBigViewInCall(),
          buttonsRowContainer(),
          personSmallViewInCall()
        ]),
      ),
    );
  }

  Positioned personSmallViewInCall() {
    return Positioned(
        right: 20,
        bottom: 137,
        child: Obx(
          () => VideoCallPersonView(
              onDoubleTap: () => videoCallController.changeViewPlaces(),
              videoCallViewModel: VideoCallUtility.personSmallView(
                  videoCallController.isViewPlaceChanged.value
                      ? DemoInformation.therapist
                      : DemoInformation.personNo1,
                  false)),
        ));
  }

  Align buttonsRowContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: AppColors.lightBlack,
          height: SizeUtil.mediumValueHeight,
          width: window.physicalSize.width,
          child: const VideoCallButtonsRow()),
    );
  }

  Obx personBigViewInCall() {
    return Obx(
      () => VideoCallPersonView(
          onDoubleTap: () => videoCallController.changeViewPlaces(),
          videoCallViewModel: VideoCallUtility.personBigView(
              videoCallController.isViewPlaceChanged.value
                  ? DemoInformation.personNo1
                  : DemoInformation.therapist,
              false)),
    );
  }
}
