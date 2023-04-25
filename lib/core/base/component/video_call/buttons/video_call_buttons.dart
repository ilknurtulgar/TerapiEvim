import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/video_call/container/circular_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/video_call/util/utility.dart';

class CustomVideoCallButton extends StatelessWidget {
  const CustomVideoCallButton(
      {super.key,
      required this.onTap,
      required this.isThisOn,
      required this.icon,
      this.offIcon,
      this.backgroundColor,
      required this.isInsideContainer});

  final Function() onTap;
  final RxBool isThisOn;
  final Icon icon;
  final Icon? offIcon;
  final Color? backgroundColor;
  final bool isInsideContainer;

  @override
  Widget build(BuildContext context) {
    return isInsideContainer == false
        ? iconButton(isInsideContainer, context)
        : CircularContainer(
            height: Responsive.height(SizeUtil.normalValueHeight, context),
            color: backgroundColor!,
            widget: iconButton(isInsideContainer, context),
          );
  }

  IconButton iconButton(isInsideContainer, context) {
    return IconButton(
        iconSize: isInsideContainer
            ? Responsive.height(30, context)
            : Responsive.height(24, context),
        icon: Obx(() => isThisOn.value ? icon : offIcon!),
        onPressed: onTap);
  }
}

class VideoCallButtonsRow extends StatelessWidget {
  VideoCallButtonsRow({
    super.key,
    this.firstButton,
    required this.onToggleMicButtonPressed,
    required this.onToggleCameraButtonPressed,
    required this.onLeaveButtonPressed,
    required this.isMicOn,
    required this.isCameraOn,
  });

  final Widget? firstButton;
  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onLeaveButtonPressed;
  final RxBool isMicOn, isCameraOn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.height1 < 750 && firstButton != null
          ? EdgeInsets.only(bottom: 16, top: 8)
          : AppPaddings.customContainerInsidePadding(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: firstButton != null
                ? EdgeInsets.only(right: 16)
                : EdgeInsets.zero,
            child: firstButton ?? const SizedBox(),
          ),
          VideoCallUtility.cameraIconButton(
            onTap: onToggleCameraButtonPressed,
            isInsideContainer: true,
            isCamOn: isCameraOn,
          ),
          Padding(
            padding: AppPaddings.customContainerInsidePadding(1),
            child: VideoCallUtility.micIconButton(
                onTap: onToggleMicButtonPressed,
                isInsideContainer: true,
                isMicOn: isMicOn),
          ),
          VideoCallUtility.endingCallButton(onLeaveButtonPressed),
        ],
      ),
    );
  }
}
