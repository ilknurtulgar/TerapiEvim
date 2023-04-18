import 'package:flutter/material.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/t_group_information_view.dart';

import '../../../controller/therapist/group/t_group_view.dart';
import '../../../core/base/view/base_view.dart';

// ignore: must_be_immutable
class TGroupView extends StatelessWidget {
  const TGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<TGroupViewController>(
        getController: TGroupViewController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) => controller.isLockedOpen.value
            ? TGroupInformationView()
            : const TGroupInformationView());
  }
}
