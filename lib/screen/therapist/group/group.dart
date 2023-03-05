import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/screen/therapist/group/confirmation/lock_screen_therapist.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/group_information.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/my_groups_view.dart';

// ignore: must_be_immutable
class TherapistGroupPage extends StatelessWidget {
  TherapistGroupPage({super.key});
  TherapistGroupController controller = Get.put(TherapistGroupController());

  @override
  Widget build(BuildContext context) {
    return controller.isLockedOpen.isTrue
        ? const MyGroups()
        : const LockScreenTherapist();
  }
}
