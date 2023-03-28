import 'package:flutter/material.dart';

class MeetingControls extends StatelessWidget {
  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onLeaveButtonPressed;

  const MeetingControls({
    Key? key,
    required this.onToggleMicButtonPressed,
    required this.onToggleCameraButtonPressed,
    required this.onLeaveButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          child: const Text("Leave"),
          onPressed: onLeaveButtonPressed,
        ),
        ElevatedButton(
          child: const Text("Toggle Mic"),
          onPressed: onToggleMicButtonPressed,
        ),
        ElevatedButton(
          child: const Text("Toggle Camera"),
          onPressed: onToggleCameraButtonPressed,
        )
      ],
    );
  }
}