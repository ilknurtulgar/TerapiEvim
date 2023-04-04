import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/video_call_controller.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import 'package:terapievim/core/base/component/video_call/container/video_call_person.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/video_call/util/utility.dart';

// ignore: must_be_immutable
class IsolatedCallView extends StatelessWidget {
  IsolatedCallView({super.key});

  ///TODO: videocallcontroller baseview çevirmen gerekiyor
  VideoCallController videoCallController = Get.put(
      VideoCallController()); // daha önce başka bir sayfa için kullanılmadığı için uygulama şu anlık hata vermesin diye get.put kullandım ileriki süreçte get.find'a çeviririz
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
        bottom: 120,
        child: Obx(
          () => VideoCallPerson(
            onDoubleTap: () => videoCallController.changeViewPlaces(),
            videoCallViewModel: VideoCallUtility.personSmallView(
                videoCallController.isViewPlaceChanged.value
                    ? DemoInformation.therapist
                    : DemoInformation.personNo1,
                false),
            whichPage: 2,
            isLongPressActive: false,
          ),
        ));
  }

  Align buttonsRowContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: AppColors.lightBlack,
          height: SizeUtil.mediumValueHeight,
          width: window.physicalSize.width,
          child: VideoCallButtonsRow(
            onLeaveButtonPressed: () {},
            onToggleCameraButtonPressed: () {},
            onToggleMicButtonPressed: () {},
          )),
    );
  }

  Obx personBigViewInCall() {
    return Obx(
      () => VideoCallPerson(
        onDoubleTap: () => videoCallController.changeViewPlaces(),
        videoCallViewModel: VideoCallUtility.personBigView(
            videoCallController.isViewPlaceChanged.value
                ? DemoInformation.personNo1
                : DemoInformation.therapist,
            false),
        whichPage: 2,
        isLongPressActive: false,
      ),
    );
  }
}
