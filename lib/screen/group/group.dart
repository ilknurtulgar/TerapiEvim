import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/service/mainController.dart';

import 'ui/my_group.dart';
import 'ui/scl90/lock_screen.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key});

  MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return _controller.isTestNotSolved.isTrue
        ? LockScreen()
        : _controller.isTestResultReady.isTrue
            ? MyGroup()
            : LockScreen();
  }
}
