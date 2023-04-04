import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/main_controller.dart';
import 'package:terapievim/controller/video_call_controller.dart';
import 'package:terapievim/core/base/component/video_call/container/circular_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/video_call/util/utility.dart';

class CustomVideoCallButton extends StatelessWidget {
  const CustomVideoCallButton(
      {super.key,
      required this.onTap,
      required this.isThisOn,
      required this.icon,
      this.offIcon,
      required this.backgroundColor});

  final Function() onTap;
  final RxBool isThisOn;
  final Icon icon;
  final Icon? offIcon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      height: Responsive.height(SizeUtil.normalValueHeight, context),
      color: backgroundColor,
      widget: IconButton(
          iconSize: 30,
          icon: Obx(() => isThisOn.value ? icon : offIcon!),
          onPressed: onTap),
    );
  }
}

class VideoCallButtonsRow extends StatelessWidget {
  VideoCallButtonsRow({
    super.key,
    required this.onToggleMicButtonPressed,
    required this.onToggleCameraButtonPressed,
    required this.onLeaveButtonPressed,
    this.isGroupTherapyCall,
    this.isHandsUp,
  });
  MainController mainController = Get.find();
  VideoCallController videoCallController = Get.find();
  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onLeaveButtonPressed;
  bool? isGroupTherapyCall;
  RxBool? isHandsUp;

  @override
  Widget build(BuildContext context) {
    isGroupTherapyCall ??= false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        isGroupTherapyCall!
            ? Obx(
                () => mainController.isTherapist.value
                    ? VideoCallUtility.therapistSpecialButton(() =>
                        videoCallController
                            .openTherapistTab(DemoInformation.participants))
                    : VideoCallUtility.putYourHandsUpButton(
                        () => videoCallController.onOffFunction(isHandsUp!),
                        isHandsUp!),
              )
            : const SizedBox(),
        SizedBox(
          width: isGroupTherapyCall! ? 16 : 0,
        ),
        VideoCallUtility.cameraIconButton(
            onToggleCameraButtonPressed, true.obs),
        Padding(
          padding: AppPaddings.customContainerInsidePadding(3),
          child: VideoCallUtility.micIconButton(
              onToggleMicButtonPressed, true.obs),
        ),
        VideoCallUtility.endingCallButton(onLeaveButtonPressed),
      ],
    );
  }
}
