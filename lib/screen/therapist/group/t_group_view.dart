import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/therapist/group/t_group_verification_controller.dart';
import '../../../core/base/view/base_view.dart';
import 'confirmation/t_lock_view.dart';
import 't_my_groups_view.dart';

// ignore: must_be_immutable
class TGroupView extends StatelessWidget {
  const TGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<TGroupVerificationController>(
        getController: TGroupVerificationController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) => controller.isLockedOpen.isTrue
            ? const TMyGroupsView()
            : const TLockView());
  }
}
