import 'package:flutter/material.dart';
import 'package:terapievim/screen/therapist/group/group_add/t_group_add_view.dart';

import '../../../controller/therapist/group/t_group_view.dart';
import '../../../core/base/view/base_view.dart';
import 'confirmation/t_lock_view.dart';

// ignore: must_be_immutable
class TGroupView extends StatelessWidget {
  const TGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<TGroupViewController>(
        getController: TGroupViewController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) => controller.isLockedOpen.value
            ? TGroupAddView()
            : const TLockView());
  }
}
