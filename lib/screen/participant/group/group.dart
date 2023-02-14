import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/participant/group/category_determination/short_call/determining_to_shortcall_time.dart';
import 'package:terapievim/screen/therapist/home/home.dart';
import '../../../controller/main_controller.dart';
import 'my_group.dart';
import 'scl90/lock_screen.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key});

  final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return TherapistHome();
    // return _controller.isGroupReady.isTrue
    //     ? const MyGroup()
    //     : const LockScreen();
  }
}
