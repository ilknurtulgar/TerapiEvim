import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/video_call_utility.dart';
import '../../../core/base/util/base_utility.dart';
import '../../container/circular_container.dart';

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
    return Padding(
      padding: widget.icon == IconUtility.micIcon(true)
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.symmetric(vertical: 15),
      child: CircularContainer(
        height: 64,
        color: widget.backgroundColor,
        widget: IconButton(
            iconSize: 30,
            icon: widget.isThisOn ? widget.icon : widget.offIcon!,
            onPressed: widget.onTap),
      ),
    );
  }
}

class VideoCallButtonsRow extends StatelessWidget {
  const VideoCallButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        VideoCallUtility.cameraIconButton(() => () {}, true),
        VideoCallUtility.micIconButton(() => () {}, true),
        VideoCallUtility.endingCallButton(() => () {}),
      ],
    );
  }
}
