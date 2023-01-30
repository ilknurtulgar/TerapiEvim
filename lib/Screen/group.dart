import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:terapievim/scl90/lock_screen.dart';
import 'package:terapievim/service/mainController.dart';

import '../core/base/util/base_utility.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key});

  MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return _controller.isTestSolved.isTrue
        ? Center(
            child: Text("Group"),
          )
        : LockScreen();
  }
}
