import 'package:flutter/material.dart';
import 'package:terapievim/screen/therapist/profile/settings/t_settings.dart';

// ignore: must_be_immutable
class TherapistGroupPage extends StatelessWidget {
  const TherapistGroupPage({super.key});
  @override
  Widget build(BuildContext context) {
    return TSettings();
    // return BaseView<GroupVerificationController>(
    //     getController: GroupVerificationController(),
    //     onModelReady: (model) {},
    //     onPageBuilder: (context, controller) => controller.isLockedOpen.isTrue
    //         ? const MyGroups()
    //         : const LockScreenTherapist());
  }
}
