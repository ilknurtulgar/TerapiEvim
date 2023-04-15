import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/therapist/group/group_add/t_group_add_view.dart';

import '../../../controller/therapist/group/t_group_verification_controller.dart';
import '../../../core/base/view/base_view.dart';
import 'confirmation/t_lock_view.dart';

// ignore: must_be_immutable
class TGroupView extends StatelessWidget {
  const TGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<TGroupVerificationController>(
        getController: TGroupVerificationController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) => controller.isLockedOpen.isTrue
            ? TGroupAddView()
            : const TLockView());
  }
}
