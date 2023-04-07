import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return isInsideContainer==false
      ? iconButton(isInsideContainer)
      : CircularContainer(
          height: Responsive.height(SizeUtil.normalValueHeight, context),
          color: backgroundColor!,
          widget: iconButton(isInsideContainer),
        );
  }

  IconButton iconButton(isInsideContainer) {
    return IconButton(
        iconSize: isInsideContainer ? 30 : 22,
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
  });
  final Widget? firstButton;
  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onLeaveButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
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
            onToggleCameraButtonPressed,true,true.obs),
        Padding(
          padding: AppPaddings.customContainerInsidePadding(3),
          child: VideoCallUtility.micIconButton(
              onToggleMicButtonPressed,true,true.obs),
        ),
        VideoCallUtility.endingCallButton(onLeaveButtonPressed),
      ],
    );
  }
}
