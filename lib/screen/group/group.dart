import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/main_controller.dart';
import 'package:terapievim/screen/group/participant_ui/my_group.dart';
import 'package:terapievim/screen/group/participant_ui/scl90/lock_screen.dart';

// ignore: must_be_immutable
class GroupScreen extends StatelessWidget {
  GroupScreen({super.key});

  final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return _controller.isTestNotSolved.isTrue
        ? const LockScreen()
        : _controller.isTestResultReady.isTrue
            ? const MyGroup()
            : const LockScreen();
  }
}
