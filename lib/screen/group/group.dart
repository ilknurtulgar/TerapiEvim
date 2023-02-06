import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/group/participant_ui/category_determination/group_categories/group_categories.dart';
import 'package:terapievim/controller/mainController.dart';
import 'package:terapievim/screen/group/participant_ui/therapist.dart';

import 'participant_ui/my_group.dart';
import 'participant_ui/scl90/lock_screen.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key});

  MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return TherapistProfile();
    // return _controller.isTestNotSolved.isTrue
    //     ? LockScreen()
    //     : _controller.isTestResultReady.isTrue
    //         ? MyGroup()
    //         : LockScreen();
  }
}
