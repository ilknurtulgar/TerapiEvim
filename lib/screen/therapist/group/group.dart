import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/screen/therapist/group/confirmation/lock_screen_therapist.dart';
import '../../../controller/therapist/group/group_verification_controller.dart';
import 'groups_informations/my_groups_view.dart';

// ignore: must_be_immutable
class TherapistGroupPage extends StatelessWidget {
  const TherapistGroupPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<GroupVerificationController>(
        getController: GroupVerificationController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) => controller.isLockedOpen.isTrue
            ? const MyGroups()
            : const LockScreenTherapist());
  }
}
