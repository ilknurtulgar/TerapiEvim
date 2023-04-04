import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/group/p_group_controller.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';

import 'package:terapievim/core/base/util/base_utility.dart';

// ignore: must_be_immutable
class ToggleQuestions extends StatelessWidget {
  ToggleQuestions({super.key, required this.question});
  final String question;

  PGroupController groupController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.componentPadding,
      padding: AppPaddings.componentPadding,
      decoration: AppBoxDecoration.purpleBorder,
      child: Column(children: [
        CustomHeading(
          padding: AppPaddings.rowViewPadding,
          isalignmentstart: false,
          isToggle: true,
          text: question,
        ),
        selecttoggle(),
      ]),
    );
  }

  Obx selecttoggle() {
    return Obx(
      () => ToggleButtons(
        direction: Axis.horizontal,
        onPressed: ((int index) {
          groupController.selecttooggle(index);
        }),
        borderRadius: AppBorderRadius.generalBorderRadius,
        borderColor: BorderColorUtil.toggleBorderColor,
        selectedBorderColor: BorderColorUtil.toggleBorderColor,
        fillColor: AppColors.transparent,
        selectedColor: AppColors.cornFlowerBlue,
        splashColor: AppColors.transparent,
        constraints: const BoxConstraints(minHeight: 3, minWidth: 3),
        borderWidth: 20,
        isSelected: groupController.selectedchoice,
        children: groupController.choice,
      ),
    );
  }
}
