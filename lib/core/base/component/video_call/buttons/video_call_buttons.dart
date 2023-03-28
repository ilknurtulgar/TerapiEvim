import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/video_call/video_call_container/circular_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/video_call/util/utility.dart';

class CustomVideoCallButton extends StatefulWidget {
  const CustomVideoCallButton(
      {super.key,
      required this.onTap,
      required this.isThisOn,
      required this.icon,
      this.offIcon,
      required this.backgroundColor});

  final Function() onTap;
  final bool isThisOn;
  final Icon icon;
  final Icon? offIcon;
  final Color backgroundColor;

  @override
  State<CustomVideoCallButton> createState() => _CustomVideoCallButtonState();
}

class _CustomVideoCallButtonState extends State<CustomVideoCallButton> {
  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      height: SizeUtil.normalValueHeight,
      color: widget.backgroundColor,
      widget: IconButton(
          iconSize: 30,
          icon: widget.isThisOn ? widget.icon : widget.offIcon!,
          onPressed: widget.onTap),
    );
  }
}

class VideoCallButtonsRow extends StatelessWidget {
  const VideoCallButtonsRow({
    super.key,
    required this.onToggleMicButtonPressed,
    required this.onToggleCameraButtonPressed,
    required this.onLeaveButtonPressed,
  });

  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onLeaveButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        VideoCallUtility.cameraIconButton(onToggleCameraButtonPressed, true),
        Padding(
          padding: AppPaddings.customContainerInsidePadding(3),
          child: VideoCallUtility.micIconButton(onToggleMicButtonPressed, true),
        ),
        VideoCallUtility.endingCallButton(onLeaveButtonPressed),
      ],
    );
  }
}
