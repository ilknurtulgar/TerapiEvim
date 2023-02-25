import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/therapist/group/group_add/group_add_view.dart';
import 'package:terapievim/screen/therapist/group/my_groups_view.dart';
import '../../../controller/main_controller.dart';
import 'my_group.dart';
import 'scl90/lock_screen.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key});

  final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GroupAddView();
    // return _controller.isGroupReady.isTrue
    //     ? const MyGroup()
    //     : const LockScreen();
  }
}
